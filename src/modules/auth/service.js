import { prisma } from "../../lib/prisma.js";
import ConflictError from "../../errors/ConflictError.js";
import ValidationError from "../../errors/ValidationError.js";

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

  if (existingUser?.email === email) {
    throw new ConflictError([
      {
        field: "email",
        code: "EMAIL_ALREADY_EXISTS",
        message: "Email address is already in use",
      },
    ]);
  }

  if (existingUser?.username === username) {
    throw new ConflictError([
      {
        field: "username",
        code: "USERNAME_ALREADY_EXISTS",
        message: "Username is already in use",
      },
    ]);
  }
}
