import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere } from "./query.js";
import { mapCardRanges } from "./mapper.js";

export async function findCardRanges({ filters, lang, sort }) {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const cardRanges = await prisma.card_range.findMany({
    where,
    orderBy,
    select: {
      code: true,
      card_range_translation: {
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

  const formattedCardRanges = mapCardRanges(cardRanges);

  return sortByTranslatedName(formattedCardRanges, sort, lang);
}
