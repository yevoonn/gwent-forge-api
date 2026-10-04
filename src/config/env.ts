interface RequiredEnv {
  JWT_ACCESS_SECRET: string;
  JWT_ACCESS_EXPIRES_IN: string;
  JWT_REFRESH_SECRET: string;
  JWT_REFRESH_EXPIRES_IN: string;
  FRONTEND_URL: string;
  EMAIL_VERIFICATION_TOKEN_EXPIRES_IN: string;
  PASSWORD_RESET_TOKEN_EXPIRES_IN: string;
  RESEND_API_KEY: string;
  GOOGLE_CLIENT_ID: string;
  GOOGLE_CLIENT_SECRET: string;
  GOOGLE_CALLBACK_URL: string;
}

const REQUIRED_KEYS: (keyof RequiredEnv)[] = [
  "JWT_ACCESS_SECRET",
  "JWT_ACCESS_EXPIRES_IN",
  "JWT_REFRESH_SECRET",
  "JWT_REFRESH_EXPIRES_IN",
  "FRONTEND_URL",
  "EMAIL_VERIFICATION_TOKEN_EXPIRES_IN",
  "PASSWORD_RESET_TOKEN_EXPIRES_IN",
  "RESEND_API_KEY",
  "GOOGLE_CLIENT_ID",
  "GOOGLE_CLIENT_SECRET",
  "GOOGLE_CALLBACK_URL",
];

function loadRequiredEnv(): RequiredEnv {
  const missing = REQUIRED_KEYS.filter((key) => !process.env[key]);

  if (missing.length > 0) {
    throw new Error(
      `Missing required environment variables: ${missing.join(", ")}`,
    );
  }

  return {
    JWT_ACCESS_SECRET: process.env.JWT_ACCESS_SECRET as string,
    JWT_ACCESS_EXPIRES_IN: process.env.JWT_ACCESS_EXPIRES_IN as string,
    JWT_REFRESH_SECRET: process.env.JWT_REFRESH_SECRET as string,
    JWT_REFRESH_EXPIRES_IN: process.env.JWT_REFRESH_EXPIRES_IN as string,
    FRONTEND_URL: process.env.FRONTEND_URL as string,
    EMAIL_VERIFICATION_TOKEN_EXPIRES_IN: process.env
      .EMAIL_VERIFICATION_TOKEN_EXPIRES_IN as string,
    PASSWORD_RESET_TOKEN_EXPIRES_IN: process.env
      .PASSWORD_RESET_TOKEN_EXPIRES_IN as string,
    RESEND_API_KEY: process.env.RESEND_API_KEY as string,
    GOOGLE_CLIENT_ID: process.env.GOOGLE_CLIENT_ID as string,
    GOOGLE_CLIENT_SECRET: process.env.GOOGLE_CLIENT_SECRET as string,
    GOOGLE_CALLBACK_URL: process.env.GOOGLE_CALLBACK_URL as string,
  };
}

export const env = {
  ...loadRequiredEnv(),
  NODE_ENV: process.env.NODE_ENV ?? "development",
  PORT: process.env.PORT ?? "3000",
};
