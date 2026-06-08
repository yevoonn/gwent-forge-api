import { Router } from "express";
import cardsRoutes from "../modules/cards/routes.js";

const router = Router();

router.use("/cards", cardsRoutes);

export default router;
