import { findCards } from "./service.js";
import { parseQueryArray } from "./helper.js";

export async function getCards(req, res) {
  try {
    const lang = req.query.lang ?? "en";
    const sort = req.query.sort ?? "name_asc";
    const filters = {
      deck: req.query.deck?.toUpperCase(),
      type: req.query.type?.toUpperCase(),
      range: req.query.range?.toUpperCase(),
      abilities: parseQueryArray(req.query.ability),
      search: req.query.search,
      lang: lang,
      is_deck_card: req.query.is_deck_card === "false" ? false : true,
      codes: parseQueryArray(req.query.code),
    };

    const cards = await findCards({
      filters,
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
