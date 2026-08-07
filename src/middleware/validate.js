import ValidationError from "../errors/ValidationError.js";

const validate = (schema) => {
  return (req, res, next) => {
    const result = schema.safeParse(req.body);

    if (!result.success) {
      const details = result.error.issues.map((issue) => ({
        field: issue.path.join("."),
        code: `${issue.path.join(".")}_${issue.code}`,
        message: issue.message,
      }));

      throw new ValidationError(details);
    }

    req.body = result.data;

    next();
  };
};

export default validate;
