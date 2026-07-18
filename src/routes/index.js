import { Router } from "express";
import cardsRoutes from "../modules/cards/routes.js";
import decksRoutes from "../modules/decks/routes.js";
import cardAbilitiesRoutes from "../modules/card_abilities/routes.js";
import cardRangesRoutes from "../modules/card_ranges/routes.js";
import cardTypesRoutes from "../modules/card_types/routes.js";

const router = Router();

router.use("/cards", cardsRoutes);
router.use("/decks", decksRoutes);
router.use("/card-abilities", cardAbilitiesRoutes);
router.use("/card-ranges", cardRangesRoutes);
router.use("/card-types", cardTypesRoutes);

export default router;
