import jwt, { type JwtPayload } from "jsonwebtoken";
import { env } from "../config/env.js";

interface AccessTokenUser {
  id: number;
  role: string;
}

interface AccessTokenPayload extends JwtPayload {
  role: string;
}

/**
 * Access tokens are short-lived and contain the information required
 * to authorize API requests without querying the database on every request.
 */
export function generateAccessToken(user: AccessTokenUser): string {
  return jwt.sign({ role: user.role }, env.JWT_ACCESS_SECRET, {
    subject: String(user.id),
    expiresIn: env.JWT_ACCESS_EXPIRES_IN as jwt.SignOptions["expiresIn"],
  });
}

/**
 * Refresh tokens contain only the user's ID.
 * They are long-lived and are used exclusively to obtain a new access token.
 */
export function generateRefreshToken(userId: number): string {
  return jwt.sign({}, env.JWT_REFRESH_SECRET, {
    subject: String(userId),
    expiresIn: env.JWT_REFRESH_EXPIRES_IN as jwt.SignOptions["expiresIn"],
  });
}

/**
 * Access tokens are verified using a dedicated secret so that a refresh token
 * cannot be accepted as an access token.
 */
export function verifyAccessToken(token: string): AccessTokenPayload {
  return jwt.verify(token, env.JWT_ACCESS_SECRET) as AccessTokenPayload;
}

/**
 * Refresh tokens use a separate secret and verification path.
 * This prevents an access token from being accepted by /refresh.
 */
export function verifyRefreshToken(token: string): JwtPayload {
  return jwt.verify(token, env.JWT_REFRESH_SECRET) as JwtPayload;
}

/**
 * Converts a JWT duration string (e.g. "15m", "7d", "2h")
 * into milliseconds.
 */
export function parseJWTDuration(duration: string | undefined): number {
  const match = duration?.match(/^(\d+)(s|m|h|d)$/);

  if (!match) {
    throw new Error(`Invalid JWT duration: ${duration}`);
  }

  const value = Number(match[1]);
  const unit = match[2] as "s" | "m" | "h" | "d";

  const multipliers: Record<"s" | "m" | "h" | "d", number> = {
    s: 1000,
    m: 60 * 1000,
    h: 60 * 60 * 1000,
    d: 24 * 60 * 60 * 1000,
  };

  return value * multipliers[unit];
}
