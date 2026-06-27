export function mapCards(cards) {
  return cards.map((card) => ({
    code: card.code,
    power: card.power,
    image_url: card.image_url,
    name: card.card_translation[0]?.name ?? null,
    type: card.card_type.card_type_translation[0]?.name ?? null,
    range: {
      code: card.card_range?.code,
      name: card.card_range?.card_range_translation[0]?.name ?? null,
    },
    abilities: card.card_ability_relationship.map((relationship) => ({
      code: relationship.card_ability.code,
      name: relationship.card_ability.card_ability_translation[0]?.name ?? null,
      description:
        relationship.card_ability.card_ability_translation[0]?.description ??
        null,
    })),
  }));
}
