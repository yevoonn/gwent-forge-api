import type { NextFunction, Request, Response } from "express";
import AuthorizationError from "../errors/AuthorizationError.js";

/**
 * Authentication is handled by authenticate().
 * This middleware only checks whether the authenticated user
 * has the role required to access the endpoint.
 */
const requireRole = (role: string) => {
  return (req: Request, res: Response, next: NextFunction): void => {
    if (req.user?.role !== role) {
      throw new AuthorizationError();
    }

    next();
  };
};

export default requireRole;
