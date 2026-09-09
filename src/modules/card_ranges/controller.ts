import type { Request, Response } from "express";
import { findCardRanges } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";
import type { CardRangeFilters } from "./query.js";

export async function getCardRanges(
  req: Request,
  res: Response,
): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const sort = (req.query.sort as string | undefined) ?? "code_asc";

  const filters: CardRangeFilters = {
    search: req.query.search as string | undefined,
    lang,
    codes: parseQueryArray(req.query.code),
  };

  const cardRanges = await findCardRanges({ filters, lang, sort });

  res.json(cardRanges);
}
