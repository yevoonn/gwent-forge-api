import { prisma } from "../../lib/prisma.js";
import { getOrderBy, sortCards, buildWhere } from "./helper.js";
import { mapCards } from "./mapper.js";

export async function findCards({ filters, lang, sort }) {
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

      card_type: {
        select: {
          card_type_translation: {
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
      },

      card_range: {
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
      },

      card_ability_relationship: {
        select: {
          card_ability: {
            select: {
              code: true,

              card_ability_translation: {
                where: {
                  language: {
                    code: lang,
                  },
                },

                take: 1,

                select: {
                  name: true,
                  description: true,
                },
              },
            },
          },
        },
      },
    },
  });

  const formattedCards = mapCards(cards);

  return sortCards(formattedCards, sort, lang);
}
