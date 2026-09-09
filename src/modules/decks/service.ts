import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere, type DeckFilters } from "./query.js";
import { mapDecks, type MappedDeck } from "./mapper.js";

interface FindDecksParams {
  filters: DeckFilters;
  lang: string;
  sort: string | undefined;
}

export async function findDecks({
  filters,
  lang,
  sort,
}: FindDecksParams): Promise<MappedDeck[]> {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const decks = await prisma.deck.findMany({
    where,
    orderBy,
    select: {
      code: true,
      deck_translation: {
        where: { language: { code: lang } },
        take: 1,
        select: { name: true },
      },
    },
  });

  const formattedDecks = mapDecks(decks);

  return sortByTranslatedName(formattedDecks, sort, lang);
}
