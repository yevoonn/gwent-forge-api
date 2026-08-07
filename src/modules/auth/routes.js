import { Router } from "express";
import * as authController from "./controller.js";
import validate from "../../middleware/validate.js";
import { registerSchema } from "./validationSchemas.js";

const router = Router();

router.post("/health", validate(registerSchema), authController.health);

export default router;
