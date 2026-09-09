import { Router } from "express";
import { getCardTypes } from "./controller.js";

const router = Router();

router.get("/", getCardTypes);

export default router;
