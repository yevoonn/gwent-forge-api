import { Router } from "express";
import { getDecks } from "./controller.js";

const router = Router();

router.get("/", getDecks);

export default router;
