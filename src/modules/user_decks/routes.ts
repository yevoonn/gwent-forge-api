import { Router, type RequestHandler } from "express";
import * as userDeckController from "./controller.js";
import validate from "../../middleware/validate.js";
import authenticate from "../../middleware/authenticate.js";
import {
  createUserDeckSchema,
  updateUserDeckSchema,
} from "./validationSchemas.js";

const router = Router();

router.post(
  "/",
  authenticate,
  validate(createUserDeckSchema),
  userDeckController.createUserDeck as RequestHandler,
);

router.get(
  "/",
  authenticate,
  userDeckController.getUserDecks as RequestHandler,
);

router.get(
  "/:id",
  authenticate,
  userDeckController.getUserDeckById as RequestHandler,
);

router.patch(
  "/:id",
  authenticate,
  validate(updateUserDeckSchema),
  userDeckController.updateUserDeck as RequestHandler,
);

router.delete(
  "/:id",
  authenticate,
  userDeckController.deleteUserDeck as RequestHandler,
);

export default router;
