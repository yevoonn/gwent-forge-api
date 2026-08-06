import { Router } from "express";
import * as authController from "./controller.js";

const router = Router();

router.get("/health", authController.health);

export default router;
