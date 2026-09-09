import type { Request, Response } from "express";
import { findDecks } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";
import type { DeckFilters } from "./query.js";

export async function getDecks(req: Request, res: Response): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const sort = (req.query.sort as string | undefined) ?? "code_asc";

  const filters: DeckFilters = {
    search: req.query.search as string | undefined,
    lang,
    codes: parseQueryArray(req.query.code),
  };

  const decks = await findDecks({ filters, lang, sort });

  res.json(decks);
}
