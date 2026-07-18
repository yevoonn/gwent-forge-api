export function mapCardRanges(cardRanges) {
  return cardRanges.map((range) => ({
    code: range.code,
    name: range.card_range_translation[0]?.name ?? null,
  }));
}
