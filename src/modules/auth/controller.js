import * as authService from "./service.js";

const REFRESH_TOKEN_COOKIE = "refresh_token";

export function health(req, res) {
  const result = authService.health();

  res.status(200).json(result);
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
