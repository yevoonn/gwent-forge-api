import { env } from "../../config/env.js";

interface SendVerificationEmailInput {
  email: string;
  token: string;
}

export async function sendVerificationEmail({
  email,
  token,
}: SendVerificationEmailInput): Promise<void> {
  const verificationUrl = `${env.FRONTEND_URL}/verify-email?token=${encodeURIComponent(token)}`;

  console.log(`[EMAIL] Verification email for ${email}: ${verificationUrl}`);
}
