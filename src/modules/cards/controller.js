import { prisma } from "../../lib/prisma.js";

export async function getCards(req, res) {
  const cards = await prisma.card.findMany();

  res.json(cards);
}

export async function getCardsByDeck(req, res) {
  const deckId = Number(req.params.deckId);

  const cards = await prisma.card.findMany({
    where: {
      deck_id: deckId,
      is_deck_card: true,
    },
    include: {
      card_translation: true,
      card_type: true,
      card_range: true,
    },
  });

  res.json(cards);
}
