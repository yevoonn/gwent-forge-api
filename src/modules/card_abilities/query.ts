import type { Prisma } from "@prisma/client";

export interface CardAbilityFilters {
  search?: string;
  lang: string;
  codes?: string[];
  is_special?: boolean;
}

export function getOrderBy(
  sort: string | undefined,
): Prisma.card_abilityOrderByWithRelationInput {
  switch (sort) {
    case "id_asc":
      return { id: "asc" };

    case "id_desc":
      return { id: "desc" };

    case "code_asc":
      return { code: "asc" };

    case "code_desc":
      return { code: "desc" };

    default:
      return { code: "asc" };
  }
}

export function buildWhere(
  filters: CardAbilityFilters,
): Prisma.card_abilityWhereInput {
  const { search, lang, codes, is_special } = filters;

  const where: Prisma.card_abilityWhereInput = {};

  if (is_special === true || is_special === false) {
    where.is_special = is_special;
  }

  if (search) {
    where.card_ability_translation = {
      some: {
        language: { code: lang },
        name: { contains: search, mode: "insensitive" },
      },
    };
  }

  if (codes?.length) {
    where.code = { in: codes };
  }

  return where;
}
