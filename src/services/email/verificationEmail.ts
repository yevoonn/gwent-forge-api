import { Resend } from "resend";
import { env } from "../../config/env.js";

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

  const { data, error } = await resend.emails.send({
    from: "Gwent Forge <onboarding@resend.dev>",
    to: email,
    subject: "Verify your Gwent Forge email address",
    html: `
      <h1>Verify your email address</h1>

      <p>
        Thank you for creating a Gwent Forge account.
      </p>

      <p>
        Click the link below to verify your email address:
      </p>

      <p>
        <a href="${verificationUrl}">
          Verify email address
        </a>
      </p>

      <p>
        This link will expire after a limited time.
      </p>
    `,
  });

  if (error) {
    throw new Error(`Failed to send verification email: ${error.message}`);
  }

  console.log("Email sent successfully!");
  console.log("Email ID:", data?.id);
}
