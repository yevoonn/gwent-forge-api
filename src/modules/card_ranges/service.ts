import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere, type CardRangeFilters } from "./query.js";
import { mapCardRanges, type MappedCardRange } from "./mapper.js";

interface FindCardRangesParams {
  filters: CardRangeFilters;
  lang: string;
  sort: string | undefined;
}

export async function findCardRanges({
  filters,
  lang,
  sort,
}: FindCardRangesParams): Promise<MappedCardRange[]> {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const cardRanges = await prisma.cardRange.findMany({
    where,
    orderBy,
    select: {
      code: true,
      card_range_translation: {
        where: {
          language: { code: lang },
        },
        take: 1,
        select: { name: true },
      },
    },
  });

  const formattedCardRanges = mapCardRanges(cardRanges);

  return sortByTranslatedName(formattedCardRanges, sort, lang);
}
