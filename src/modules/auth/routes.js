import { Router } from "express";
import * as authController from "./controller.js";
import validate from "../../middleware/validate.js";
import authenticate from "../../middleware/authenticate.js";
import requireRole from "../../middleware/requireRole.js";
import { loginSchema, registerSchema } from "./validationSchemas.js";

const router = Router();

router.post("/health", validate(registerSchema), authController.health);
router.post("/register", validate(registerSchema), authController.register);
router.post("/login", validate(loginSchema), authController.login);
router.post("/refresh", authController.refresh);
router.get("/profile", authenticate, authController.profile);
router.get(
  "/admin-profile",
  authenticate,
  requireRole("ADMIN"),
  authController.adminProfile,
);

export default router;
