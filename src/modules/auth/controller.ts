import type { Request, Response } from "express";
import type { AuthenticatedRequest } from "../../types/express.js";
import * as authService from "./service.js";
import AuthenticationError from "../../errors/AuthenticationError.js";
import { parseJWTDuration } from "../../utils/jwt.js";
import { env } from "../../config/env.js";

const REFRESH_TOKEN_COOKIE = "refresh_token";

function getRefreshTokenCookieOptions() {
  return {
    httpOnly: true,
    secure: env.NODE_ENV === "production",
    sameSite: (env.NODE_ENV === "production" ? "none" : "lax") as
      | "none"
      | "lax",
  };
}

export function health(req: Request, res: Response): void {
  const result = authService.health();

  res.status(200).json(result);
}

export async function profile(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const user = await authService.getProfile(req.user.id);

  res.status(200).json({ user });
}

export async function updateProfile(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const user = await authService.updateProfile(req.user.id, req.body);

  res.status(200).json({ user });
}

export async function changePassword(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  await authService.changePassword(req.user.id, req.body);

  res.status(204).send();
}

export function adminProfile(req: AuthenticatedRequest, res: Response): void {
  res.status(200).json({
    message: "You have access to the admin profile",
    user: req.user,
  });
}

export async function register(req: Request, res: Response): Promise<void> {
  const user = await authService.register(req.body);

  res.status(201).json(user);
}

export async function login(req: Request, res: Response): Promise<void> {
  const result = await authService.login(req.body);

  // The refresh token is stored in an HttpOnly cookie so that
  // client-side JavaScript cannot access it directly.
  // The access token is returned in the response and is intended
  // to be sent in the Authorization header for protected requests.
  res.cookie(REFRESH_TOKEN_COOKIE, result.refreshToken, {
    ...getRefreshTokenCookieOptions(),
    maxAge: parseJWTDuration(env.JWT_REFRESH_EXPIRES_IN),
  });

  // The refresh token is intentionally not returned in the response body.
  res.status(200).json({
    user: result.user,
    accessToken: result.accessToken,
  });
}

export async function logout(req: Request, res: Response): Promise<void> {
  const refreshToken = req.cookies[REFRESH_TOKEN_COOKIE];

  if (refreshToken) {
    await authService.revokeRefreshToken(refreshToken);
  }

  // Removing the refresh_token cookie ends the browser's ability
  // to request a new access token through /refresh.
  res.clearCookie(REFRESH_TOKEN_COOKIE, getRefreshTokenCookieOptions());

  res.status(204).send();
}

export async function refresh(req: Request, res: Response): Promise<void> {
  // The refresh token is intentionally read only from the HttpOnly cookie.
  // It is never accepted from the request body or Authorization header.
  const refreshToken = req.cookies[REFRESH_TOKEN_COOKIE];

  if (!refreshToken) {
    throw new AuthenticationError(
      "INVALID_REFRESH_TOKEN",
      "Invalid refresh token",
    );
  }

  const result = await authService.refresh(refreshToken);

  // Replace the old refresh token with the newly rotated one.
  // The token remains inaccessible to client-side JavaScript.
  res.cookie(REFRESH_TOKEN_COOKIE, result.refreshToken, {
    ...getRefreshTokenCookieOptions(),
    maxAge: parseJWTDuration(env.JWT_REFRESH_EXPIRES_IN),
  });

  // Only the user and access token are exposed to the client.
  res.status(200).json({
    user: result.user,
    accessToken: result.accessToken,
  });
}
