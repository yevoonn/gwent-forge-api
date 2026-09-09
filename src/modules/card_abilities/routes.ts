import { Router } from "express";
import { getCardAbilities } from "./controller.js";

const router = Router();

router.get("/", getCardAbilities);

export default router;
