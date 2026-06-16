export function getOrderBy(sort) {
  switch (sort) {
    case "power_asc":
      return { power: "asc" };

    case "power_desc":
      return { power: "desc" };

    case "code_asc":
      return { code: "asc" };

    case "code_desc":
      return { code: "desc" };

    default:
      return { code: "asc" };
  }
}

export function sortCards(cards, sort, lang) {
  switch (sort) {
    case "name_asc":
      return [...cards].sort((a, b) =>
        (a.name ?? "").localeCompare(b.name ?? "", lang),
      );

    case "name_desc":
      return [...cards].sort((a, b) =>
        (b.name ?? "").localeCompare(a.name ?? "", lang),
      );

    default:
      return cards;
  }
}

export function buildWhere(filters) {
  const { deck, type, range, abilities, search, lang, is_deck_card } = filters;

  const where = {
    is_deck_card: is_deck_card,
  };

  if (deck) {
    where.deck = {
      code: deck,
    };
  }

  if (type) {
    where.card_type = {
      code: type,
    };
  }

  if (range) {
    where.card_range = {
      code: range,
    };
  }

  if (abilities?.length) {
    where.card_ability_relationship = {
      some: {
        card_ability: {
          code: {
            in: abilities,
          },
        },
      },
    };
  }

  if (search) {
    where.card_translation = {
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

  return where;
}

/**
 * Converts query param values into an array.
 *
 * Supports:
 * - ?ability=bond
 * - ?ability=bond,spy
 * - ?ability=bond&ability=spy
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
