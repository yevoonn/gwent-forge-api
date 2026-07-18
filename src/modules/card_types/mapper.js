export function mapCardTypes(cardTypes) {
  return cardTypes.map((type) => ({
    code: type.code,
    name: type.card_type_translation[0]?.name ?? null,
  }));
}
