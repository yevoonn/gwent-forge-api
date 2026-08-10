import { Router } from "express";
import * as authController from "./controller.js";
import validate from "../../middleware/validate.js";
import { loginSchema, registerSchema } from "./validationSchemas.js";

const router = Router();

router.post("/health", validate(registerSchema), authController.health);
router.post("/register", validate(registerSchema), authController.register);
router.post("/login", validate(loginSchema), authController.login);

export default router;
