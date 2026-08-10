import { prisma } from "../../lib/prisma.js";
import AuthenticationError from "../../errors/AuthenticationError.js";
import ConflictError from "../../errors/ConflictError.js";
import ValidationError from "../../errors/ValidationError.js";
import { hashPassword, verifyPassword } from "../../utils/password.js";
import { mapPrismaError } from "../../utils/mapPrismaError.js";
import { generateAccessToken, generateRefreshToken } from "../../utils/jwt.js";

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

  const passwordHash = await hashPassword(password);

  try {
    const user = await prisma.user.create({
      data: {
        email,
        username,
        passwordHash,
      },
    });

    return {
      id: user.id,
      email: user.email,
      username: user.username,
      role: user.role,
      isEmailVerified: user.isEmailVerified,
    };
  } catch (error) {
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

  if (!user) {
    throw new AuthenticationError();
  }

  const isPasswordValid = await verifyPassword(password, user.passwordHash);

  if (!isPasswordValid) {
    throw new AuthenticationError();
  }

  const accessToken = generateAccessToken(user);
  const refreshToken = generateRefreshToken(user);

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
