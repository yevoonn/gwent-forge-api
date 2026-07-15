import { Router } from "express";
import cardsRoutes from "../modules/cards/routes.js";
import decksRoutes from "../modules/decks/routes.js";
import cardAbilitiesRoutes from "../modules/card_abilities/routes.js";

const router = Router();

router.use("/cards", cardsRoutes);
router.use("/decks", decksRoutes);
router.use("/card-abilities", cardAbilitiesRoutes);

export default router;
