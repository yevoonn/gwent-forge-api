import { findCards } from "./service.js";

export async function getCards(req, res) {
  try {
    const deck = req.query.deck?.toUpperCase();
    const lang = req.query.lang ?? "en";
    const sort = req.query.sort ?? "name_asc";

    const cards = await findCards({
      deck,
      lang,
      sort,
    });

    res.json(cards);
  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: "Internal server error",
    });
  }
}
