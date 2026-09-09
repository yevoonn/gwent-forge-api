import type { Request } from "express";

declare global {
  namespace Express {
    interface Request {
      user?: {
        id: number;
        role: string;
      };
    }
  }
}

export interface AuthenticatedRequest extends Request {
  user: {
    id: number;
    role: string;
  };
}
