import { Prisma } from "@prisma/client";

const cardRangeWithTranslation =
  Prisma.validator<Prisma.card_rangeDefaultArgs>()({
    select: {
      code: true,
      card_range_translation: {
        select: { name: true },
      },
    },
  });

type CardRangeWithTranslation = Prisma.card_rangeGetPayload<
  typeof cardRangeWithTranslation
>;

export interface MappedCardRange {
  code: string;
  name: string | null;
}

export function mapCardRanges(
  cardRanges: CardRangeWithTranslation[],
): MappedCardRange[] {
  return cardRanges.map((range) => ({
    code: range.code,
    name: range.card_range_translation[0]?.name ?? null,
  }));
}
