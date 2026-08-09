import AppError from "./AppError.js";

class ConflictError extends AppError {
  constructor(details = []) {
    super("Conflict", 409, "CONFLICT", details);
  }
}

export default ConflictError;
