import { prisma } from "../../lib/prisma.js";
import ConflictError from "../../errors/ConflictError.js";
import ValidationError from "../../errors/ValidationError.js";
import { hashPassword } from "../../utils/password.js";

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
}
