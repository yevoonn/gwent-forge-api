import { prisma } from "../../lib/prisma.js";
import NotFoundError from "../../errors/NotFoundError.js";
import ValidationError, {
  type ValidationErrorDetail,
} from "../../errors/ValidationError.js";
import {
  mapUserDeckListItems,
  mapUserDeckDetail,
  type MappedUserDeckListItem,
  type MappedUserDeckDetail,
} from "./mapper.js";
import type {
  CreateUserDeckInput,
  UpdateUserDeckInput,
} from "./validationSchemas.js";

/**
 * Ensures every given card code belongs to the card pool of the given
 * game deck. Throws a ValidationError listing every code that doesn't,
 * so the client can point out exactly which selections were invalid.
 * Returns the matching cards ids, keyed by code, so callers that
 * already need to look up ids don't have to query twice.
 */
async function ensureCardsBelongToDeck(
  deckId: number,
  cardCodes: string[],
): Promise<Map<string, number>> {
  const validCards = await prisma.card.findMany({
    where: {
      deck_id: deckId,
      code: { in: cardCodes },
    },
    select: { id: true, code: true },
  });

  const cardIdByCode = new Map(validCards.map((card) => [card.code, card.id]));
  const invalidCodes = cardCodes.filter((code) => !cardIdByCode.has(code));

  if (invalidCodes.length > 0) {
    const errorDetails: ValidationErrorDetail[] = invalidCodes.map((code) => ({
      field: "cardCodes",
      code: "CARD_NOT_IN_DECK_POOL",
      message: `Card "${code}" does not belong to the selected deck`,
    }));

    throw new ValidationError(errorDetails);
  }

  return cardIdByCode;
}

/**
 * Loads a user deck by id and verifies it belongs to the given user.
 * Returns null both when the deck doesn't exist and when it belongs
 * to someone else, so callers cannot distinguish the two cases.
 */
async function findOwnedUserDeck(userDeckId: number, userId: number) {
  const userDeck = await prisma.userDeck.findUnique({
    where: { id: userDeckId },
  });

  if (!userDeck || userDeck.userId !== userId) {
    return null;
  }

  return userDeck;
}

function getUserDeckNotFoundError(): NotFoundError {
  return new NotFoundError("USER_DECK_NOT_FOUND", "User deck not found");
}

export async function createUserDeck(
  userId: number,
  { deckId, name, description, cardCodes }: CreateUserDeckInput,
): Promise<MappedUserDeckDetail> {
  const cardIdByCode = await ensureCardsBelongToDeck(deckId, cardCodes);
  const languages = await prisma.language.findMany({ select: { id: true } });

  const userDeck = await prisma.userDeck.create({
    data: {
      userId,
      deckId,
      user_deck_translation: {
        create: languages.map((language) => ({
          languageId: language.id,
          name,
          description,
        })),
      },
      user_deck_card: {
        create: cardCodes.map((code) => ({
          cardId: cardIdByCode.get(code) as number,
        })),
      },
    },
    select: {
      id: true,
      deckId: true,
      createdAt: true,
      updatedAt: true,
      user_deck_translation: {
        select: { name: true, description: true },
      },
      user_deck_card: {
        select: { card: { select: { code: true } } },
      },
    },
  });

  return mapUserDeckDetail(userDeck);
}

export async function findUserDecks(
  userId: number,
  lang: string,
): Promise<MappedUserDeckListItem[]> {
  const userDecks = await prisma.userDeck.findMany({
    where: { userId },
    orderBy: { createdAt: "desc" },
    select: {
      id: true,
      deckId: true,
      createdAt: true,
      updatedAt: true,
      user_deck_translation: {
        where: { language: { code: lang } },
        take: 1,
        select: { name: true, description: true },
      },
    },
  });

  return mapUserDeckListItems(userDecks);
}

export async function findUserDeckById(
  userDeckId: number,
  userId: number,
  lang: string,
): Promise<MappedUserDeckDetail> {
  const ownedUserDeck = await findOwnedUserDeck(userDeckId, userId);

  if (!ownedUserDeck) {
    throw getUserDeckNotFoundError();
  }

  const userDeck = await prisma.userDeck.findUniqueOrThrow({
    where: { id: userDeckId },
    select: {
      id: true,
      deckId: true,
      createdAt: true,
      updatedAt: true,
      user_deck_translation: {
        where: { language: { code: lang } },
        take: 1,
        select: { name: true, description: true },
      },
      user_deck_card: {
        select: { card: { select: { code: true } } },
      },
    },
  });

  return mapUserDeckDetail(userDeck);
}

export async function updateUserDeck(
  userDeckId: number,
  userId: number,
  { lang, name, description, cardCodes }: UpdateUserDeckInput,
): Promise<MappedUserDeckDetail> {
  const ownedUserDeck = await findOwnedUserDeck(userDeckId, userId);

  if (!ownedUserDeck) {
    throw getUserDeckNotFoundError();
  }

  let cardIdByCode: Map<string, number> | null = null;

  if (cardCodes) {
    cardIdByCode = await ensureCardsBelongToDeck(
      ownedUserDeck.deckId,
      cardCodes,
    );
  }

  // Translation update and card set replacement must succeed or fail together.
  await prisma.$transaction(async (tx) => {
    // Use tx (not prisma) here so every query joins this transaction.
    if (lang && (name !== undefined || description !== undefined)) {
      // Update only the translation row for the given language.
      await tx.userDeckTranslation.updateMany({
        where: { userDeckId, language: { code: lang } },
        data: {
          ...(name !== undefined ? { name } : {}),
          ...(description !== undefined ? { description } : {}),
        },
      });
    }

    if (cardCodes && cardIdByCode) {
      // Full replace: delete the old card set, then insert the new one.
      await tx.userDeckCard.deleteMany({ where: { userDeckId } });

      await tx.userDeckCard.createMany({
        data: cardCodes.map((code) => ({
          userDeckId,
          cardId: cardIdByCode!.get(code) as number, // already validated above
        })),
      });
    }
  });

  return findUserDeckById(userDeckId, userId, lang ?? "en");
}

export async function deleteUserDeck(
  userDeckId: number,
  userId: number,
): Promise<void> {
  const ownedUserDeck = await findOwnedUserDeck(userDeckId, userId);

  if (!ownedUserDeck) {
    throw getUserDeckNotFoundError();
  }

  await prisma.userDeck.delete({ where: { id: userDeckId } });
}
