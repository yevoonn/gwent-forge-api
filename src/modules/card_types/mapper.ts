import { Prisma } from "@prisma/client";

const cardTypeWithTranslation = Prisma.validator<Prisma.card_typeDefaultArgs>()(
  {
    select: {
      code: true,
      card_type_translation: {
        select: { name: true },
      },
    },
  },
);

type CardTypeWithTranslation = Prisma.card_typeGetPayload<
  typeof cardTypeWithTranslation
>;

export interface MappedCardType {
  code: string;
  name: string | null;
}

export function mapCardTypes(
  cardTypes: CardTypeWithTranslation[],
): MappedCardType[] {
  return cardTypes.map((type) => ({
    code: type.code,
    name: type.card_type_translation[0]?.name ?? null,
  }));
}
