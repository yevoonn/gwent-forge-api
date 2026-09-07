import type { NextFunction, Request, Response } from "express";
import type { ZodType } from "zod";
import ValidationError, {
  type ValidationErrorDetail,
} from "../errors/ValidationError.js";

/**
 * Validate and parse the request body using the schema provided by the route.
 */
const validate = <T>(schema: ZodType<T>) => {
  return (req: Request, res: Response, next: NextFunction): void => {
    // safeParse() prevents Zod from throwing on validation errors.
    const result = schema.safeParse(req.body);

    if (!result.success) {
      // Convert Zod issues into our API error format.
      // The field-specific code allows the frontend to map errors directly to translation keys.
      const details: ValidationErrorDetail[] = result.error.issues.map(
        (issue) => ({
          field: issue.path.join("."),
          code: `${issue.path.join(".")}_${issue.code}`,
          message: issue.message,
        }),
      );

      throw new ValidationError(details);
    }

    // Use Zod's parsed data instead of the original request body.
    // This is important because schemas may also normalize values,
    // e.g. trim whitespace or convert email addresses to lowercase.
    req.body = result.data;

    next();
  };
};

export default validate;
