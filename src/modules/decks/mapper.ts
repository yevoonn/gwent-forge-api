import { Prisma } from "@prisma/client";

const deckWithTranslation = Prisma.validator<Prisma.deckDefaultArgs>()({
  select: {
    code: true,
    deck_translation: {
      select: { name: true },
    },
  },
});

type DeckWithTranslation = Prisma.deckGetPayload<typeof deckWithTranslation>;

export interface MappedDeck {
  code: string;
  name: string | null;
}

export function mapDecks(decks: DeckWithTranslation[]): MappedDeck[] {
  return decks.map((deck) => ({
    code: deck.code,
    name: deck.deck_translation[0]?.name ?? null,
  }));
}
