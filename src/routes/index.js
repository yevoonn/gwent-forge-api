import { Router } from "express";
import cardsRoutes from "../modules/cards/routes.js";
import decksRoutes from "../modules/decks/routes.js";

const router = Router();

router.use("/cards", cardsRoutes);
router.use("/decks", decksRoutes);

export default router;
