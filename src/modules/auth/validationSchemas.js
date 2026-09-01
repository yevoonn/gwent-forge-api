import { z } from "zod";

/**
 * Schema used when creating a new account.
 * Besides validation, it also normalizes the email and removes
 * unnecessary whitespace from user-provided fields.
 */
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
    .max(12, "Username must contain at most 12 characters"),
  password: z
    .string()
    .min(8, "Password must contain at least 8 characters")
    .max(128, "Password must contain at most 128 characters"),
});

/**
 * Login accepts only the credentials required for authentication.
 * The same email normalization rules are used as during registration
 * so that email lookup is consistent.
 */
export const loginSchema = z.object({
  email: z
    .string()
    .trim()
    .email("Please enter a valid email address")
    .toLowerCase(),
  password: z
    .string()
    .min(8, "Password must contain at least 8 characters")
    .max(128, "Password must contain at most 128 characters"),
});

/**
 * Schema used when updating the authenticated user's profile.
 * Currently, only the username can be changed.
 */
export const updateProfileSchema = z.object({
  username: z
    .string()
    .trim()
    .min(3, "Username must contain at least 3 characters")
    .max(12, "Username must contain at most 12 characters"),
});

/**
 * Schema used when changing the authenticated user's password.
 * The current password is required to verify the user's identity,
 * while the new password must satisfy the same password rules
 * as during registration.
 */
export const changePasswordSchema = z.object({
  currentPassword: z.string().min(1, "Current password is required"),
  newPassword: z
    .string()
    .min(8, "Password must contain at least 8 characters")
    .max(128, "Password must contain at most 128 characters"),
});
