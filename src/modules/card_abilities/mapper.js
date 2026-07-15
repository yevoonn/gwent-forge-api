export function mapCardAbilities(cardAbilities) {
  return cardAbilities.map((ability) => ({
    code: ability.code,
    name: ability.card_ability_translation[0]?.name ?? null,
  }));
}
