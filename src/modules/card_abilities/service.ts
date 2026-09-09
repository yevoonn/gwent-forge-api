import { prisma } from "../../lib/prisma.js";
import { sortByTranslatedName } from "../../utils/query.js";
import { getOrderBy, buildWhere, type CardAbilityFilters } from "./query.js";
import { mapCardAbilities, type MappedCardAbility } from "./mapper.js";

interface FindCardAbilitiesParams {
  filters: CardAbilityFilters;
  lang: string;
  sort: string | undefined;
}

export async function findCardAbilities({
  filters,
  lang,
  sort,
}: FindCardAbilitiesParams): Promise<MappedCardAbility[]> {
  const where = buildWhere(filters);
  const orderBy = getOrderBy(sort);

  const cardAbilities = await prisma.card_ability.findMany({
    where,
    orderBy,
    select: {
      code: true,

      card_ability_translation: {
        where: {
          language: { code: lang },
        },

        take: 1,

        select: { name: true },
      },
    },
  });

  const formattedCardAbilities = mapCardAbilities(cardAbilities);

  return sortByTranslatedName(formattedCardAbilities, sort, lang);
}
