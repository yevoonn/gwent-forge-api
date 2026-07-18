import { Router } from "express";
import { getCardRanges } from "./controller.js";

const router = Router();

router.get("/", getCardRanges);

export default router;
