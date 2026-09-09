import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere, type CardFilters } from "./query.js";
import { mapCards, type MappedCard } from "./mapper.js";

interface FindCardsParams {
  filters: CardFilters;
  lang: string;
  sort: string | undefined;
}

export async function findCards({
  filters,
  lang,
  sort,
}: FindCardsParams): Promise<MappedCard[]> {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const cards = await prisma.card.findMany({
    where,
    orderBy,
    select: {
      code: true,
      power: true,
      image_url: true,

      card_translation: {
        where: { language: { code: lang } },
        take: 1,
        select: { name: true },
      },

      card_type: {
        select: {
          code: true,
          card_type_translation: {
            where: { language: { code: lang } },
            take: 1,
            select: { name: true },
          },
        },
      },

      card_range: {
        select: {
          code: true,
          card_range_translation: {
            where: { language: { code: lang } },
            take: 1,
            select: { name: true },
          },
        },
      },

      card_ability_relationship: {
        select: {
          card_ability: {
            select: {
              code: true,
              card_ability_translation: {
                where: { language: { code: lang } },
                take: 1,
                select: { name: true, description: true },
              },
            },
          },
        },
      },

      deck: {
        select: {
          code: true,
          deck_translation: {
            where: { language: { code: lang } },
            take: 1,
            select: { name: true },
          },
        },
      },
    },
  });

  const formattedCards = mapCards(cards);

  return sortByTranslatedName(formattedCards, sort, lang);
}
