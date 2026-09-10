import { Prisma } from "@prisma/client";

const deckWithTranslation = Prisma.validator<Prisma.DeckDefaultArgs>()({
  select: {
    code: true,
    deck_translation: {
      select: { name: true },
    },
  },
});

type DeckWithTranslation = Prisma.DeckGetPayload<typeof deckWithTranslation>;

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
