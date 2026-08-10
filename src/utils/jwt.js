import jwt from "jsonwebtoken";

export function generateAccessToken(user) {
  return jwt.sign({ role: user.role }, process.env.JWT_ACCESS_SECRET, {
    subject: String(user.id),
    expiresIn: process.env.JWT_ACCESS_EXPIRES_IN,
  });
}

export function generateRefreshToken(user) {
  return jwt.sign({}, process.env.JWT_REFRESH_SECRET, {
    subject: String(user.id),
    expiresIn: process.env.JWT_REFRESH_EXPIRES_IN,
  });
}

export function verifyAccessToken(token) {
  return jwt.verify(token, process.env.JWT_ACCESS_SECRET);
}

export function verifyRefreshToken(token) {
  return jwt.verify(token, process.env.JWT_REFRESH_SECRET);
}
