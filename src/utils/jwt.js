import jwt from "jsonwebtoken";

/**
 * Access tokens are short-lived and contain the information required
 * to authorize API requests without querying the database on every request.
 */
export function generateAccessToken(user) {
  return jwt.sign({ role: user.role }, process.env.JWT_ACCESS_SECRET, {
    subject: String(user.id),
    expiresIn: process.env.JWT_ACCESS_EXPIRES_IN,
  });
}

/**
 * Refresh tokens contain only the user's ID.
 * They are long-lived and are used exclusively to obtain a new access token.
 */
export function generateRefreshToken(user) {
  return jwt.sign({}, process.env.JWT_REFRESH_SECRET, {
    subject: String(user.id),
    expiresIn: process.env.JWT_REFRESH_EXPIRES_IN,
  });
}

/**
 * Access tokens are verified using a dedicated secret so that a refresh token
 * cannot be accepted as an access token.
 */
export function verifyAccessToken(token) {
  return jwt.verify(token, process.env.JWT_ACCESS_SECRET);
}

/**
 * Refresh tokens use a separate secret and verification path.
 * This prevents an access token from being accepted by /refresh.
 */
export function verifyRefreshToken(token) {
  return jwt.verify(token, process.env.JWT_REFRESH_SECRET);
}
