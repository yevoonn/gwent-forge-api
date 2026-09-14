import type { Response } from "express";
import type { AuthenticatedRequest } from "../../types/express.js";
import * as userDeckService from "./service.js";
import ValidationError from "../../errors/ValidationError.js";

function getInvalidUserDeckIdError(): ValidationError {
  return new ValidationError([
    {
      field: "id",
      code: "INVALID_USER_DECK_ID",
      message: "User deck id must be a positive integer",
    },
  ]);
}

function parseUserDeckId(rawId: string | string[] | undefined): number {
  if (typeof rawId !== "string") {
    throw getInvalidUserDeckIdError();
  }

  const id = Number(rawId);

  if (!Number.isInteger(id) || id <= 0) {
    throw getInvalidUserDeckIdError();
  }

  return id;
}

export async function createUserDeck(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const userDeck = await userDeckService.createUserDeck(req.user.id, req.body);

  res.status(201).json({ userDeck });
}

export async function getUserDecks(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const userDecks = await userDeckService.findUserDecks(req.user.id, lang);

  res.status(200).json({ userDecks });
}

export async function getUserDeckById(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const userDeckId = parseUserDeckId(req.params.id);
  const userDeck = await userDeckService.findUserDeckById(
    userDeckId,
    req.user.id,
    lang,
  );

  res.status(200).json({ userDeck });
}

export async function updateUserDeck(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const userDeckId = parseUserDeckId(req.params.id);
  const userDeck = await userDeckService.updateUserDeck(
    userDeckId,
    req.user.id,
    req.body,
  );

  res.status(200).json({ userDeck });
}

export async function deleteUserDeck(
  req: AuthenticatedRequest,
  res: Response,
): Promise<void> {
  const userDeckId = parseUserDeckId(req.params.id);

  await userDeckService.deleteUserDeck(userDeckId, req.user.id);

  res.status(204).send();
}
