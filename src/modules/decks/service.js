import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere } from "./query.js";
import { mapDecks } from "./mapper.js";

export async function findDecks({ filters, lang, sort }) {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const decks = await prisma.deck.findMany({
    where,
    orderBy,
    select: {
      code: true,

      deck_translation: {
        where: {
          language: {
            code: lang,
          },
        },

        take: 1,

        select: {
          name: true,
        },
      },
    },
  });

  const formattedDecks = mapDecks(decks);

  return sortByTranslatedName(formattedDecks, sort, lang);
}
