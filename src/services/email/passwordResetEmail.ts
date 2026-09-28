import { Resend } from "resend";
import { env } from "../../config/env.js";
import { getPasswordResetEmailTemplate } from "./templates/passwordReset/index.js";

const resend = new Resend(env.RESEND_API_KEY);

interface SendPasswordResetEmailInput {
  email: string;
  token: string;
  lang: "en" | "pl" | "it";
}

export async function sendPasswordResetEmail({
  email,
  token,
  lang,
}: SendPasswordResetEmailInput): Promise<void> {
  const resetUrl = `${env.FRONTEND_URL}/reset-password?token=${encodeURIComponent(token)}`;

  const { subject, html } = getPasswordResetEmailTemplate(lang, {
    resetUrl,
    year: new Date().getFullYear(),
  });

  const { data, error } = await resend.emails.send({
    from: "Gwent Forge <noreply@gwentforge.com>",
    to: email,
    subject,
    html,
  });

  if (error) {
    throw new Error(`Failed to send password reset email: ${error.message}`);
  }

  console.log("Password reset email sent successfully!");
  console.log("Email ID:", data?.id);
}
