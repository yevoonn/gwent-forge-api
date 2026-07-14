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

export function buildWhere(filters) {
  const { deck, type, range, abilities, search, lang, is_deck_card, codes } =
    filters;

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

  if (codes?.length) {
    where.code = {
      in: codes,
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
