import type { NextFunction, Request, Response } from "express";
import AppError from "../errors/AppError.js";

/**
 * Convert application errors into a consistent API response.
 * Unknown errors fall back to a generic 500 response so that
 * internal implementation details are not exposed to the client.
 */
const errorHandler = (
  err: unknown,
  req: Request,
  res: Response,
  next: NextFunction,
): void => {
  if (err instanceof AppError) {
    res.status(err.statusCode).json({
      error: {
        code: err.code,
        message: err.message,
        details: err.details,
      },
    });
    return;
  }

  res.status(500).json({
    error: {
      code: "INTERNAL_ERROR",
      message: "Something went wrong",
      details: null,
    },
  });
};

export default errorHandler;
