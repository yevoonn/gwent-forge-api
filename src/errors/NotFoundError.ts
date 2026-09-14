import AppError from "./AppError.js";

class NotFoundError extends AppError {
  constructor(code = "NOT_FOUND", message = "Resource not found") {
    super(message, 404, code);
  }
}

export default NotFoundError;
