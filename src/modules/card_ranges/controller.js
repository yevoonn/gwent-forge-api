import { findCardRanges } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";

export async function getCardRanges(req, res) {
  try {
    const lang = req.query.lang ?? "en";
    const sort = req.query.sort ?? "code_asc";
    const filters = {
      search: req.query.search,
      lang,
      codes: parseQueryArray(req.query.code),
    };

    const cardRanges = await findCardRanges({
      filters,
      lang,
      sort,
    });

    res.json(cardRanges);
  } catch (error) {
    console.error(error);

    res.status(500).json({
      error: "Internal server error",
    });
  }
}
