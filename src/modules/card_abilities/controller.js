import { findCardAbilities } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";

export async function getCardAbilities(req, res) {
  try {
    const lang = req.query.lang ?? "en";
    const sort = req.query.sort ?? "code_asc";
    const filters = {
      search: req.query.search,
      lang: lang,
      codes: parseQueryArray(req.query.code),
    };

    const cardAbilities = await findCardAbilities({
      filters,
      lang,
      sort,
    });

    res.json(cardAbilities);
  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: "Internal server error",
    });
  }
}
