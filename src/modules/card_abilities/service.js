import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere } from "./query.js";
import { mapCardAbilities } from "./mapper.js";

export async function findCardAbilities({ filters, lang, sort }) {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const cardAbilities = await prisma.card_ability.findMany({
    where,
    orderBy,
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
        },
      },
    },
  });

  const formattedCardAbilities = mapCardAbilities(cardAbilities);

  return sortByTranslatedName(formattedCardAbilities, sort, lang);
}
