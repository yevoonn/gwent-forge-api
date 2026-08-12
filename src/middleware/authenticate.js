import AuthenticationError from "../errors/AuthenticationError.js";
import { verifyAccessToken } from "../utils/jwt.js";

const authenticate = (req, res, next) => {
  // Access tokens are sent by the client in the Authorization header.
  const authorizationHeader = req.headers.authorization;

  if (!authorizationHeader) {
    throw new AuthenticationError(
      "INVALID_ACCESS_TOKEN",
      "Invalid access token",
    );
  }

  // Expected format:
  // Authorization: Bearer <access-token>
  const [scheme, token] = authorizationHeader.split(" ");

  if (scheme !== "Bearer" || !token) {
    throw new AuthenticationError(
      "INVALID_ACCESS_TOKEN",
      "Invalid access token",
    );
  }

  try {
    // Verifies the token signature and expiration using the access-token secret.
    const payload = verifyAccessToken(token);

    // Store only the information required by protected endpoints.
    // The controllers can access it through req.user without handling JWTs directly.
    req.user = {
      id: Number(payload.sub),
      role: payload.role,
    };

    next();
  } catch {
    // Do not expose whether the token was expired, malformed, or signed
    // with an invalid secret. All such cases result in the same API error.
    throw new AuthenticationError(
      "INVALID_ACCESS_TOKEN",
      "Invalid access token",
    );
  }
};

export default authenticate;
