import { Prisma } from "@prisma/client";
import ConflictError, {
  type ConflictErrorDetail,
} from "../errors/ConflictError.js";

export function mapPrismaError(error: unknown): ConflictError | null {
  // P2002 is Prisma's unique-constraint violation.
  // Convert it into an application-level ConflictError so that
  // the API does not expose Prisma-specific implementation details.
  if (
    error instanceof Prisma.PrismaClientKnownRequestError &&
    error.code === "P2002"
  ) {
    const fields = (error.meta?.target as string[] | undefined) ?? [];

    const details = fields
      .map((field): ConflictErrorDetail | null => {
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
      .filter((detail): detail is ConflictErrorDetail => detail !== null);

    // Only map known fields. Unknown unique constraints should not
    // accidentally be presented as an email/username conflict.
    if (details.length > 0) {
      return new ConflictError(details);
    }
  }

  // Returning null tells the caller that this error is not handled
  // by this mapper and should be propagated unchanged.
  return null;
}
