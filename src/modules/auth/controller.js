import * as authService from "./service.js";
import AuthenticationError from "../../errors/AuthenticationError.js";

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

  res.cookie(REFRESH_TOKEN_COOKIE, result.refreshToken, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: process.env.NODE_ENV === "production" ? "none" : "lax",
    maxAge: 7 * 24 * 60 * 60 * 1000,
  });

  res.status(200).json({
    user: result.user,
    accessToken: result.accessToken,
  });
}

export function logout(req, res) {
  res.clearCookie(REFRESH_TOKEN_COOKIE, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: process.env.NODE_ENV === "production" ? "none" : "lax",
  });

  res.status(204).send();
}

export async function refresh(req, res) {
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
