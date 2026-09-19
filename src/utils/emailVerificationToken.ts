import crypto from "crypto";

const EMAIL_VERIFICATION_TOKEN_BYTES = 32;

export function generateEmailVerificationToken(): string {
  return crypto.randomBytes(EMAIL_VERIFICATION_TOKEN_BYTES).toString("hex");
}
