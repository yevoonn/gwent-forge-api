import { z } from "zod";

export const registerSchema = z.object({
  email: z.string().trim().email().toLowerCase(),
  username: z.string().trim().min(3).max(50),
  password: z.string().min(8).max(128),
});
