import { OAuth2Client } from "google-auth-library";
import { env } from "../config/env.js";

// Google OAuth client used for authorization and token verification.
const googleOAuthClient = new OAuth2Client(
  env.GOOGLE_CLIENT_ID,
  env.GOOGLE_CLIENT_SECRET,
  env.GOOGLE_CALLBACK_URL,
);

// Request only the identity scopes required for authentication.
const GOOGLE_SCOPES = ["openid", "email", "profile"];

// Minimal Google identity data required by the authentication service.
export interface GoogleUser {
  providerAccountId: string;
  email: string;
  emailVerified: boolean;
}

// Generate the Google authorization URL for the current login attempt.
export function generateGoogleAuthUrl(state: string): string {
  return googleOAuthClient.generateAuthUrl({
    access_type: "online",
    scope: GOOGLE_SCOPES,
    state,
    prompt: "select_account",
  });
}

export async function getGoogleUser(code: string): Promise<GoogleUser> {
  // Exchange the authorization code for Google tokens.
  const { tokens } = await googleOAuthClient.getToken(code);

  if (!tokens.id_token) {
    throw new Error("Google did not return an ID token");
  }

  // Verify the ID token and ensure it was issued for our OAuth client.
  const ticket = await googleOAuthClient.verifyIdToken({
    idToken: tokens.id_token,
    audience: env.GOOGLE_CLIENT_ID,
  });

  const payload = ticket.getPayload();

  // Require a stable Google account ID and a verified email address.
  if (!payload?.sub || !payload.email || payload.email_verified !== true) {
    throw new Error("Invalid Google user information");
  }

  return {
    providerAccountId: payload.sub,
    email: payload.email.toLowerCase(),
    emailVerified: payload.email_verified,
  };
}
