import { Resend } from "resend";
import { env } from "../../config/env.js";
import { getVerificationEmailTemplate } from "./templates/verification/index.js";

const resend = new Resend(env.RESEND_API_KEY);

interface SendVerificationEmailInput {
  email: string;
  token: string;
}

export async function sendVerificationEmail({
  email,
  token,
}: SendVerificationEmailInput): Promise<void> {
  const verificationUrl = `${env.FRONTEND_URL}/verify-email?token=${encodeURIComponent(token)}`;

  const { subject, html } = getVerificationEmailTemplate({ verificationUrl });

  const { data, error } = await resend.emails.send({
    from: "Gwent Forge <noreply@gwentforge.com>",
    to: email,
    subject,
    html,
  });

  if (error) {
    throw new Error(`Failed to send verification email: ${error.message}`);
  }

  console.log("Email sent successfully!");
  console.log("Email ID:", data?.id);
}
