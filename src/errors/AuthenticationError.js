import AppError from "./AppError.js";

class AuthenticationError extends AppError {
  constructor(code = "INVALID_CREDENTIALS", message = "Invalid credentials") {
    super(message, 401, code);
  }
}

export default AuthenticationError;
