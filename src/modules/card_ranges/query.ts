import type { Prisma } from "@prisma/client";

export interface CardRangeFilters {
  search?: string;
  lang: string;
  codes?: string[];
}

export function getOrderBy(
  sort: string | undefined,
): Prisma.card_rangeOrderByWithRelationInput {
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
  filters: CardRangeFilters,
): Prisma.card_rangeWhereInput {
  const { search, lang, codes } = filters;
  const where: Prisma.card_rangeWhereInput = {};

  if (search) {
    where.card_range_translation = {
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
