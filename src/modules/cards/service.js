import { prisma } from "../../lib/prisma.js";
import { getOrderBy, sortCards } from "./helper.js";
import { mapCards } from "./mapper.js";

export async function findCards({ deck, lang, sort }) {
  const orderBy = getOrderBy(sort);

  const cards = await prisma.card.findMany({
    where: {
      is_deck_card: true,

      deck: {
        code: deck,
      },
    },

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
