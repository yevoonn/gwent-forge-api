import crypto from "node:crypto";

const GOOGLE_OAUTH_STATE_BYTES = 32;

export function generateGoogleOAuthState(): string {
  return crypto.randomBytes(GOOGLE_OAUTH_STATE_BYTES).toString("hex");
}
