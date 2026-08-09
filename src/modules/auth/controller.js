import * as authService from "./service.js";

export function health(req, res) {
  const result = authService.health();

  res.status(200).json(result);
}

export async function register(req, res) {
  const result = await authService.register(req.body);

  res.status(201).json(result);
}
