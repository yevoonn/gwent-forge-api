import { Router, type RequestHandler } from "express";
import * as authController from "./controller.js";
import validate from "../../middleware/validate.js";
import authenticate from "../../middleware/authenticate.js";
import requireRole from "../../middleware/requireRole.js";
import {
  loginSchema,
  registerSchema,
  updateProfileSchema,
  changePasswordSchema,
} from "./validationSchemas.js";

const router = Router();

// Development/test endpoint used to verify the validation and error-handling flow.
router.post("/health", validate(registerSchema), authController.health);
router.post("/register", validate(registerSchema), authController.register);
router.post("/login", validate(loginSchema), authController.login);
router.post("/logout", authController.logout);
router.post("/refresh", authController.refresh);

// Protected endpoint:
// 1. authenticate verifies the access token.
// 2. profile uses the authenticated user's data from req.user.
router.get("/profile", authenticate, authController.profile as RequestHandler);

// Protected endpoint for updating the authenticated user's profile:
// 1. authenticate verifies the access token.
// 2. validate checks the request body.
// 3. updateProfile uses req.user.id to identify the user.
router.patch(
  "/profile",
  authenticate,
  validate(updateProfileSchema),
  authController.updateProfile as RequestHandler,
);

// Protected endpoint for changing the authenticated user's password:
// 1. authenticate verifies the access token.
// 2. validate checks the request body.
// 3. changePassword verifies the current password,
//    updates the password and invalidates all user sessions.
router.patch(
  "/password",
  authenticate,
  validate(changePasswordSchema),
  authController.changePassword as RequestHandler,
);

// Role-protected endpoint:
// 1. authenticate verifies the access token.
// 2. requireRole checks the user's authorization level.
router.get(
  "/admin-profile",
  authenticate,
  requireRole("ADMIN"),
  authController.adminProfile as RequestHandler,
);

export default router;
