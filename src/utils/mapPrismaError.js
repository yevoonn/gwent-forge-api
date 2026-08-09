import { Prisma } from "@prisma/client";
import ConflictError from "../errors/ConflictError.js";

export function mapPrismaError(error) {
  if (
    error instanceof Prisma.PrismaClientKnownRequestError &&
    error.code === "P2002"
  ) {
    const fields = error.meta?.target ?? [];

    const details = fields
      .map((field) => {
        if (field === "email") {
          return {
            field: "email",
            code: "EMAIL_ALREADY_EXISTS",
            message: "Email address is already in use",
          };
        }

        if (field === "username") {
          return {
            field: "username",
            code: "USERNAME_ALREADY_EXISTS",
            message: "Username is already in use",
          };
        }

        return null;
      })
      .filter(Boolean);

    if (details.length > 0) {
      return new ConflictError(details);
    }
  }

  return null;
}
