import AuthenticationError from "../errors/AuthenticationError.js";
import { verifyAccessToken } from "../utils/jwt.js";

const authenticate = (req, res, next) => {
  const authorizationHeader = req.headers.authorization;

  if (!authorizationHeader) {
    throw new AuthenticationError(
      "INVALID_ACCESS_TOKEN",
      "Invalid access token",
    );
  }

  const [scheme, token] = authorizationHeader.split(" ");

  if (scheme !== "Bearer" || !token) {
    throw new AuthenticationError(
      "INVALID_ACCESS_TOKEN",
      "Invalid access token",
    );
  }

  try {
    const payload = verifyAccessToken(token);

    req.user = {
      id: Number(payload.sub),
      role: payload.role,
    };

    next();
  } catch {
    throw new AuthenticationError(
      "INVALID_ACCESS_TOKEN",
      "Invalid access token",
    );
  }
};

export default authenticate;
