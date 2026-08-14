import * as authService from "./service.js";
import AuthenticationError from "../../errors/AuthenticationError.js";
import { parseJWTDuration } from "../../utils/jwt.js";

const REFRESH_TOKEN_COOKIE = "refresh_token";

export function health(req, res) {
  const result = authService.health();

  res.status(200).json(result);
}

export function profile(req, res) {
  res.status(200).json({
    user: req.user,
  });
}

export function adminProfile(req, res) {
  res.status(200).json({
    message: "You have access to the admin profile",
    user: req.user,
  });
}

export async function register(req, res) {
  const user = await authService.register(req.body);

  res.status(201).json(user);
}

export async function login(req, res) {
  const result = await authService.login(req.body);

  const refreshTokenExpiration = parseJWTDuration(
    process.env.JWT_REFRESH_EXPIRES_IN,
  );

  // The refresh token is stored in an HttpOnly cookie so that
  // client-side JavaScript cannot access it directly.
  // The access token is returned in the response and is intended
  // to be sent in the Authorization header for protected requests.
  res.cookie(REFRESH_TOKEN_COOKIE, result.refreshToken, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: process.env.NODE_ENV === "production" ? "none" : "lax",
    maxAge: refreshTokenExpiration,
  });

  // The refresh token is intentionally not returned in the response body.
  res.status(200).json({
    user: result.user,
    accessToken: result.accessToken,
  });
}

export function logout(req, res) {
  // Removing the refresh_token cookie ends the browser's ability
  // to request a new access token through /refresh.
  res.clearCookie(REFRESH_TOKEN_COOKIE, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: process.env.NODE_ENV === "production" ? "none" : "lax",
  });

  res.status(204).send();
}

export async function refresh(req, res) {
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

  res.status(200).json(result);
}
