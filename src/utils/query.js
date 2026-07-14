/**
 * Converts a query parameter into an array.
 *
 * Supports:
 * - ?code=A
 * - ?code=A,B
 * - ?code=A&code=B
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

export function sortByTranslatedName(items, sort, lang) {
  switch (sort) {
    case "name_asc":
      return [...items].sort((a, b) =>
        (a.name ?? "").localeCompare(b.name ?? "", lang),
      );

    case "name_desc":
      return [...items].sort((a, b) =>
        (b.name ?? "").localeCompare(a.name ?? "", lang),
      );

    default:
      return items;
  }
}
