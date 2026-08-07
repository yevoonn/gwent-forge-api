import ValidationError from "../../errors/ValidationError.js";

export function health() {
  throw new ValidationError([
    {
      field: "email",
      code: "INVALID_EMAIL",
      message: "Please enter a valid email address",
    },
  ]);
}
