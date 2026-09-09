import { prisma } from "../../lib/prisma.js";
import AuthenticationError from "../../errors/AuthenticationError.js";
import ConflictError, {
  type ConflictErrorDetail,
} from "../../errors/ConflictError.js";
import ValidationError from "../../errors/ValidationError.js";
import { hashPassword, verifyPassword } from "../../utils/password.js";
import { mapPrismaError } from "../../utils/mapPrismaError.js";
import { hashToken } from "../../utils/tokenHash.js";
import {
  generateAccessToken,
  generateRefreshToken,
  verifyRefreshToken,
  parseJWTDuration,
} from "../../utils/jwt.js";
import { env } from "../../config/env.js";
import type {
  RegisterInput,
  LoginInput,
  UpdateProfileInput,
  ChangePasswordInput,
} from "./validationSchemas.js";
import type { user as User } from "@prisma/client";

interface PublicUser {
  id: number;
  email: string;
  username: string;
  role: string;
  isEmailVerified: boolean;
}

function getPublicUser(user: User): PublicUser {
  return {
    id: user.id,
    email: user.email,
    username: user.username,
    role: user.role,
    isEmailVerified: user.isEmailVerified,
  };
}

export function health(): never {
  throw new ValidationError([
    {
      field: "email",
      code: "INVALID_EMAIL",
      message: "Please enter a valid email address",
    },
  ]);
}

export async function getProfile(userId: number): Promise<PublicUser> {
  const user = await prisma.user.findUnique({
    where: { id: userId },
  });

  if (!user) {
    throw new AuthenticationError("USER_NOT_FOUND", "User not found");
  }

  return getPublicUser(user);
}

export async function updateProfile(
  userId: number,
  { username }: UpdateProfileInput,
): Promise<PublicUser> {
  // Check whether the new username is already used by another user.
  // The current user is excluded because keeping the same username is valid.
  const existingUser = await prisma.user.findFirst({
    where: {
      username: { equals: username, mode: "insensitive" },
      NOT: { id: userId },
    },
  });

  if (existingUser) {
    throw new ConflictError([
      {
        field: "username",
        code: "USERNAME_ALREADY_EXISTS",
        message: "Username is already in use",
      },
    ]);
  }

  try {
    const user = await prisma.user.update({
      where: { id: userId },
      data: { username },
    });

    // Never return the password hash to the client.
    return getPublicUser(user);
  } catch (error) {
    const mappedError = mapPrismaError(error);

    if (mappedError) {
      throw mappedError;
    }

    throw error;
  }
}

export async function register({
  email,
  username,
  password,
}: RegisterInput): Promise<PublicUser> {
  // Check for existing users before creating a new account.
  // This allows us to return field-specific conflict errors to the client.
  const existingUser = await prisma.user.findFirst({
    where: {
      OR: [{ email }, { username: { equals: username, mode: "insensitive" } }],
    },
  });

  if (existingUser) {
    const details: ConflictErrorDetail[] = [];

    if (existingUser.email === email) {
      details.push({
        field: "email",
        code: "EMAIL_ALREADY_EXISTS",
        message: "Email address is already in use",
      });
    }

    if (existingUser.username.toLowerCase() === username.toLowerCase()) {
      details.push({
        field: "username",
        code: "USERNAME_ALREADY_EXISTS",
        message: "Username is already in use",
      });
    }

    throw new ConflictError(details);
  }

  // Passwords are never stored in plaintext.
  // Argon2id produces a secure password hash containing the parameters
  // and salt required for later verification.
  const passwordHash = await hashPassword(password);

  try {
    const user = await prisma.user.create({
      data: { email, username, passwordHash },
    });

    // Never return the password hash to the client.
    return getPublicUser(user);
  } catch (error) {
    const mappedError = mapPrismaError(error);

    if (mappedError) {
      throw mappedError;
    }

    throw error;
  }
}

export async function login({ email, password }: LoginInput) {
  const user = await prisma.user.findUnique({ where: { email } });

  // Use the same authentication error for a missing user and an invalid
  // password so that the API does not reveal which email addresses exist.
  if (!user) {
    throw new AuthenticationError();
  }

  const isPasswordValid = await verifyPassword(password, user.passwordHash);

  if (!isPasswordValid) {
    throw new AuthenticationError();
  }

  // The access token is short-lived and used to authorize API requests.
  // The refresh token is long-lived and used only to obtain a new access token.
  const accessToken = generateAccessToken(user);
  const refreshToken = generateRefreshToken(user.id);

  const refreshTokenExpiration = new Date(
    Date.now() + parseJWTDuration(env.JWT_REFRESH_EXPIRES_IN),
  );

  await prisma.user_session.create({
    data: {
      userId: user.id,
      tokenHash: hashToken(refreshToken),
      expiresAt: refreshTokenExpiration,
    },
  });

  return {
    user: getPublicUser(user),
    accessToken,
    refreshToken,
  };
}

const getInvalidRefreshTokenError = (): AuthenticationError =>
  new AuthenticationError("INVALID_REFRESH_TOKEN", "Invalid refresh token");

async function rotateRefreshToken(
  sessionId: number,
  userId: number,
): Promise<string> {
  // Generate a new refresh token instead of reusing the current one.
  // The current session will be revoked and replaced with a new session.
  const newRefreshToken = generateRefreshToken(userId);

  const refreshTokenExpiration = new Date(
    Date.now() + parseJWTDuration(env.JWT_REFRESH_EXPIRES_IN),
  );

  // Rotate the refresh token atomically:
  // 1. revoke the current session,
  // 2. create a new session for the new refresh token.
  await prisma.$transaction([
    prisma.user_session.update({
      where: { id: sessionId },
      data: { revokedAt: new Date() },
    }),
    prisma.user_session.create({
      data: {
        userId,
        tokenHash: hashToken(newRefreshToken),
        expiresAt: refreshTokenExpiration,
      },
    }),
  ]);

  return newRefreshToken;
}

export async function revokeRefreshToken(refreshToken: string): Promise<void> {
  const tokenHash = hashToken(refreshToken);

  // Revoke the active session associated with this refresh token.
  // The refresh token itself is never stored in the database.
  await prisma.user_session.updateMany({
    where: { tokenHash, revokedAt: null },
    data: { revokedAt: new Date() },
  });
}

export async function refresh(refreshToken: string) {
  let payload;

  try {
    // Verify the refresh token using the dedicated refresh token secret.
    // This also checks its signature and expiration.
    payload = verifyRefreshToken(refreshToken);
  } catch {
    throw getInvalidRefreshTokenError();
  }

  const userId = Number(payload.sub);
  const tokenHash = hashToken(refreshToken);

  // Find the active user session corresponding to this refresh token.
  const session = await prisma.user_session.findFirst({
    where: {
      tokenHash,
      userId,
      revokedAt: null,
      expiresAt: { gt: new Date() }, // gt - greater than
    },
  });

  if (!session) {
    throw getInvalidRefreshTokenError();
  }

  // The user must still exist in the database for the refresh to succeed.
  const user = await prisma.user.findUnique({ where: { id: userId } });

  if (!user) {
    throw getInvalidRefreshTokenError();
  }

  // Rotate the refresh token by revoking the current session
  // and creating a new session atomically.
  const newRefreshToken = await rotateRefreshToken(session.id, userId);

  // Issue a new short-lived access token for the user.
  const accessToken = generateAccessToken(user);

  return {
    user: getPublicUser(user),
    accessToken,
    refreshToken: newRefreshToken,
  };
}

export async function changePassword(
  userId: number,
  { currentPassword, newPassword }: ChangePasswordInput,
): Promise<void> {
  const user = await prisma.user.findUnique({ where: { id: userId } });

  if (!user) {
    throw new AuthenticationError("USER_NOT_FOUND", "User not found");
  }

  const isCurrentPasswordValid = await verifyPassword(
    currentPassword,
    user.passwordHash,
  );

  if (!isCurrentPasswordValid) {
    throw new AuthenticationError(
      "INVALID_CURRENT_PASSWORD",
      "Current password is incorrect",
    );
  }

  const passwordHash = await hashPassword(newPassword);

  await prisma.$transaction([
    prisma.user.update({
      where: { id: userId },
      data: { passwordHash },
    }),
    prisma.user_session.updateMany({
      where: { userId, revokedAt: null },
      data: { revokedAt: new Date() },
    }),
  ]);
}
