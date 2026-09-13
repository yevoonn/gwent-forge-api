import { Prisma } from "@prisma/client";

/**
 * Shape used for the list endpoint (GET /user-decks)
 */
const userDeckListItem = Prisma.validator<Prisma.UserDeckDefaultArgs>()({
  select: {
    id: true,
    deckId: true,
    createdAt: true,
    updatedAt: true,
    user_deck_translation: {
      select: { name: true, description: true },
    },
  },
});

type UserDeckListItem = Prisma.UserDeckGetPayload<typeof userDeckListItem>;

export interface MappedUserDeckListItem {
  id: number;
  deckId: number;
  name: string | null;
  description: string | null;
  createdAt: Date;
  updatedAt: Date;
}

export function mapUSerDeckListItem(
  userDecks: UserDeckListItem[],
): MappedUserDeckListItem[] {
  return userDecks.map((userDeck) => ({
    id: userDeck.id,
    deckId: userDeck.deckId,
    name: userDeck.user_deck_translation[0]?.name ?? null,
    description: userDeck.user_deck_translation[0]?.description ?? null,
    createdAt: userDeck.createdAt,
    updatedAt: userDeck.updatedAt,
  }));
}

/**
 * Shape used for the detail endpoint (GET /user-decks/:id)
 */
const userDeckWithCardCodes = Prisma.validator<Prisma.UserDeckDefaultArgs>()({
  select: {
    id: true,
    deckId: true,
    createdAt: true,
    updatedAt: true,
    user_deck_translation: {
      select: { name: true, description: true },
    },
    user_deck_card: {
      select: {
        card: {
          select: { code: true },
        },
      },
    },
  },
});

type UserDeckWithCardCodes = Prisma.UserDeckGetPayload<
  typeof userDeckWithCardCodes
>;

export interface MappedUserDeckDetail {
  id: number;
  deckId: number;
  name: string | null;
  description: string | null;
  cardCodes: string[];
  createdAt: Date;
  updatedAt: Date;
}

export function mapUserDeckDetail(
  userDeck: UserDeckWithCardCodes,
): MappedUserDeckDetail {
  return {
    id: userDeck.id,
    deckId: userDeck.deckId,
    name: userDeck.user_deck_translation[0]?.name ?? null,
    description: userDeck.user_deck_translation[0]?.description ?? null,
    cardCodes: userDeck.user_deck_card.map(({ card }) => card.code),
    createdAt: userDeck.createdAt,
    updatedAt: userDeck.updatedAt,
  };
}
