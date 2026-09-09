import { Router } from "express";
import { getCards } from "./controller.js";

const router = Router();

router.get("/", getCards);

export default router;
