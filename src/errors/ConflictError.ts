import AppError from "./AppError.js";

export interface ConflictErrorDetail {
  field: string;
  code: string;
  message: string;
}

class ConflictError extends AppError {
  constructor(details: ConflictErrorDetail[] = []) {
    super("Conflict", 409, "CONFLICT", details);
  }
}

export default ConflictError;
