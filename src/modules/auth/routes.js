import { Router } from "express";
import * as authController from "./controller.js";
import validate from "../../middleware/validate.js";
import authenticate from "../../middleware/authenticate.js";
import requireRole from "../../middleware/requireRole.js";
import { loginSchema, registerSchema } from "./validationSchemas.js";

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
router.get("/profile", authenticate, authController.profile);

// Role-protected endpoint:
// 1. authenticate verifies the access token.
// 2. requireRole checks the user's authorization level.
router.get(
  "/admin-profile",
  authenticate,
  requireRole("ADMIN"),
  authController.adminProfile,
);

export default router;
