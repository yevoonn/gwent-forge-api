import { prisma } from "../../lib/prisma.js";
import AuthenticationError from "../../errors/AuthenticationError.js";
import ConflictError from "../../errors/ConflictError.js";
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

export function health() {
  throw new ValidationError([
    {
      field: "email",
      code: "INVALID_EMAIL",
      message: "Please enter a valid email address",
    },
  ]);
}

export async function register({ email, username, password }) {
  // Check for existing users before creating a new account.
  // This allows us to return field-specific conflict errors to the client.
  const existingUser = await prisma.user.findFirst({
    where: {
      OR: [{ email }, { username }],
    },
  });

  if (existingUser) {
    const details = [];

    if (existingUser.email === email) {
      details.push({
        field: "email",
        code: "EMAIL_ALREADY_EXISTS",
        message: "Email address is already in use",
      });
    }

    if (existingUser.username === username) {
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
      data: {
        email,
        username,
        passwordHash,
      },
    });

    // Never return the password hash to the client.
    return {
      id: user.id,
      email: user.email,
      username: user.username,
      role: user.role,
      isEmailVerified: user.isEmailVerified,
    };
  } catch (error) {
    // The pre-check above improves the user experience, but it is not
    // sufficient to guarantee uniqueness in concurrent requests.
    // The database remains the final authority and may still return P2002.
    const mappedError = mapPrismaError(error);

    if (mappedError) {
      throw mappedError;
    }

    throw error;
  }
}

export async function login({ email, password }) {
  const user = await prisma.user.findUnique({
    where: {
      email,
    },
  });

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
  const refreshToken = generateRefreshToken(user);

  const refreshTokenExpiration = new Date(
    Date.now() + parseJWTDuration(process.env.JWT_REFRESH_EXPIRES_IN),
  );

  await prisma.user_session.create({
    data: {
      userId: user.id,
      tokenHash: hashToken(refreshToken),
      expiresAt: refreshTokenExpiration,
    },
  });

  return {
    user: {
      id: user.id,
      email: user.email,
      username: user.username,
      role: user.role,
      isEmailVerified: user.isEmailVerified,
    },
    accessToken,
    refreshToken,
  };
}

export async function refresh(refreshToken) {
  let payload;

  try {
    // Verify the refresh token using the dedicated refresh token secret.
    // This also checks its signature and expiration.
    payload = verifyRefreshToken(refreshToken);
  } catch {
    throw new AuthenticationError(
      "INVALID_REFRESH_TOKEN",
      "Invalid refresh token",
    );
  }

  // The token contains the user's ID as its subject.
  // The user must still exist in the database for the refresh to succeed.
  const user = await prisma.user.findUnique({
    where: {
      id: Number(payload.sub),
    },
  });

  if (!user) {
    throw new AuthenticationError(
      "INVALID_REFRESH_TOKEN",
      "Invalid refresh token",
    );
  }

  // A valid refresh token allows issuing a new short-lived access token.
  const accessToken = generateAccessToken(user);

  return {
    accessToken,
  };
}
