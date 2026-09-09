/**
 * Converts a query parameter into an array.
 *
 * Supports:
 * - ?code=A
 * - ?code=A,B
 * - ?code=A&code=B
 */
export function parseQueryArray(value: unknown): string[] | undefined {
  if (!value) {
    return undefined;
  }

  if (Array.isArray(value)) {
    return value as string[];
  }

  return String(value)
    .split(",")
    .map((v) => v.trim())
    .filter(Boolean);
}

export function sortByTranslatedName<T extends { name?: string | null }>(
  items: T[],
  sort: string | undefined,
  lang: string,
): T[] {
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
