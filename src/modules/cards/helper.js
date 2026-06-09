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
