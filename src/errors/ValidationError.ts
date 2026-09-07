import AppError from "./AppError.js";

export interface ValidationErrorDetail {
  field: string;
  code: string;
  message: string;
}

class ValidationError extends AppError {
  constructor(details: ValidationErrorDetail[]) {
    super("Validation failed", 400, "VALIDATION_ERROR", details);
  }
}

export default ValidationError;
