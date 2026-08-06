import * as authService from "./service.js";

export function health(req, res) {
  const result = authService.health();

  res.status(200).json(result);
}
