import AppError from "./AppError.js";

class ValidationError extends AppError {
  constructor(details) {
    super("Validation failed", 400, "VALIDATION_ERROR", details);
  }
}

export default ValidationError;
