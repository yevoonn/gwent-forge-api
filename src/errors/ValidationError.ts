import AppError from "./AppError.js";

class ValidationError extends AppError {
  constructor(details: unknown[]) {
    super("Validation failed", 400, "VALIDATION_ERROR", details);
  }
}

export default ValidationError;
