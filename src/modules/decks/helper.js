export function getOrderBy(sort) {
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

export function sortDecks(decks, sort, lang) {
  switch (sort) {
    case "name_asc":
      return [...decks].sort((a, b) =>
        (a.name ?? "").localeCompare(b.name ?? "", lang),
      );

    case "name_desc":
      return [...decks].sort((a, b) =>
        (b.name ?? "").localeCompare(a.name ?? "", lang),
      );

    default:
      return decks;
  }
}

export function buildWhere(filters) {
  const { search, lang, codes } = filters;

  const where = {};

  if (search) {
    where.deck_translation = {
      some: {
        language: {
          code: lang,
        },
        name: {
          contains: search,
          mode: "insensitive",
        },
      },
    };
  }

  if (codes?.length) {
    where.code = {
      in: codes,
    };
  }

  return where;
}

/**
 * Converts query param values into an array.
 *
 * Supports:
 * - ?code=NILFGAARD
 * - ?code=NILFGAARD,MONSTERS
 * - ?code=NILFGAARD&ability=MONSTERS
 */
export function parseQueryArray(value) {
  if (!value) {
    return undefined;
  }

  if (Array.isArray(value)) {
    return value;
  }

  return value
    .split(",")
    .map((v) => v.trim())
    .filter(Boolean);
}
