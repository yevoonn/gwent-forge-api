import AppError from "./AppError.js";

class AuthorizationError extends AppError {
  constructor() {
    super("Forbidden", 403, "FORBIDDEN");
  }
}

export default AuthorizationError;
