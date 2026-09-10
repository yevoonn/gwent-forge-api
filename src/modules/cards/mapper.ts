import { Prisma } from "@prisma/client";

const cardWithRelations = Prisma.validator<Prisma.CardDefaultArgs>()({
  select: {
    code: true,
    power: true,
    image_url: true,

    card_translation: {
      select: { name: true },
    },

    card_type: {
      select: {
        code: true,
        card_type_translation: {
          select: { name: true },
        },
      },
    },

    card_range: {
      select: {
        code: true,
        card_range_translation: {
          select: { name: true },
        },
      },
    },

    card_ability_relationship: {
      select: {
        card_ability: {
          select: {
            code: true,
            card_ability_translation: {
              select: { name: true, description: true },
            },
          },
        },
      },
    },

    deck: {
      select: {
        code: true,
        deck_translation: {
          select: { name: true },
        },
      },
    },
  },
});

type CardWithRelations = Prisma.CardGetPayload<typeof cardWithRelations>;

export interface MappedCardAbility {
  code: string;
  name: string | null;
  description: string | null;
}

export interface MappedCard {
  code: string;
  power: number | null;
  image_url: string | null;
  name: string | null;
  type: {
    code: string;
    name: string | null;
  };
  range: {
    code: string | undefined;
    name: string | null;
  };
  abilities: MappedCardAbility[];
  deck: {
    code: string;
    name: string | null;
  };
}

export function mapCards(cards: CardWithRelations[]): MappedCard[] {
  return cards.map((card) => ({
    code: card.code,
    power: card.power,
    image_url: card.image_url,
    name: card.card_translation[0]?.name ?? null,
    type: {
      code: card.card_type.code,
      name: card.card_type.card_type_translation[0]?.name ?? null,
    },
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
    deck: {
      code: card.deck.code,
      name: card.deck.deck_translation[0]?.name ?? null,
    },
  }));
}
