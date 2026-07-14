import { findDecks } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";

export async function getDecks(req, res) {
  try {
    const lang = req.query.lang ?? "en";
    const sort = req.query.sort ?? "code_asc";
    const filters = {
      search: req.query.search,
      lang: lang,
      codes: parseQueryArray(req.query.code),
    };

    const decks = await findDecks({
      filters,
      lang,
      sort,
    });

    res.json(decks);
  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: "Internal server error",
    });
  }
}
