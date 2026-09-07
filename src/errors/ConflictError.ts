import AppError from "./AppError.js";

class ConflictError extends AppError {
  constructor(details: unknown[] = []) {
    super("Conflict", 409, "CONFLICT", details);
  }
}

export default ConflictError;
