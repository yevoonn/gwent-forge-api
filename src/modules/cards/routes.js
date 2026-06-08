import { Router } from "express";
import { getCards, getCardsByDeck } from "./controller.js";

const router = Router();

router.get("/", getCards);
router.get("/:deckId", getCardsByDeck);

export default router;
