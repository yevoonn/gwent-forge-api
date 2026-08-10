import AppError from "./AppError.js";

class AuthenticationError extends AppError {
  constructor() {
    super("Invalid credentials", 401, "INVALID_CREDENTIALS");
  }
}

export default AuthenticationError;
