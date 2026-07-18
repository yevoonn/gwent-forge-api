import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere } from "./query.js";
import { mapCardTypes } from "./mapper.js";

export async function findCardTypes({ filters, lang, sort }) {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const cardTypes = await prisma.card_type.findMany({
    where,
    orderBy,
    select: {
      code: true,
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
  });

  const formattedCardTypes = mapCardTypes(cardTypes);

  return sortByTranslatedName(formattedCardTypes, sort, lang);
}
