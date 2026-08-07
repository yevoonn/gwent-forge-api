import { z } from "zod";

export const registerSchema = z.object({
  email: z
    .string()
    .trim()
    .email("Please enter a valid email address")
    .toLowerCase(),

  username: z
    .string()
    .trim()
    .min(3, "Username must contain at least 3 characters")
    .max(50, "Username must contain at most 50 characters"),

  password: z
    .string()
    .min(8, "Password must contain at least 8 characters")
    .max(128, "Password must contain at most 128 characters"),
});
