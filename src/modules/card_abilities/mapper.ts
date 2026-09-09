import { Prisma } from "@prisma/client";

const cardAbilityWithTranslation =
  Prisma.validator<Prisma.card_abilityDefaultArgs>()({
    select: {
      code: true,
      card_ability_translation: {
        select: { name: true },
      },
    },
  });

type CardAbilityWithTranslation = Prisma.card_abilityGetPayload<
  typeof cardAbilityWithTranslation
>;

export interface MappedCardAbility {
  code: string;
  name: string | null;
}

export function mapCardAbilities(
  cardAbilities: CardAbilityWithTranslation[],
): MappedCardAbility[] {
  return cardAbilities.map((ability) => ({
    code: ability.code,
    name: ability.card_ability_translation[0]?.name ?? null,
  }));
}
