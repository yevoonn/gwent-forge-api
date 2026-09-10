import type { Prisma } from "@prisma/client";

export interface DeckFilters {
  search?: string;
  lang: string;
  codes?: string[];
}

export function getOrderBy(
  sort: string | undefined,
): Prisma.DeckOrderByWithRelationInput {
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

export function buildWhere(filters: DeckFilters): Prisma.DeckWhereInput {
  const { search, lang, codes } = filters;

  const where: Prisma.DeckWhereInput = {};

  if (search) {
    where.deck_translation = {
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
