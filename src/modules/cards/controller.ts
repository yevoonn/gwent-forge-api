import type { Request, Response } from "express";
import { findCards } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";
import type { CardFilters } from "./query.js";

export async function getCards(req: Request, res: Response): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const sort = (req.query.sort as string | undefined) ?? "name_asc";

  const filters: CardFilters = {
    deck: (req.query.deck as string | undefined)?.toUpperCase(),
    type: (req.query.type as string | undefined)?.toUpperCase(),
    range: (req.query.range as string | undefined)?.toUpperCase(),
    abilities: parseQueryArray(req.query.ability),
    search: req.query.search as string | undefined,
    lang,
    is_deck_card: req.query.is_deck_card === "false" ? false : true,
    codes: parseQueryArray(req.query.code),
  };

  const cards = await findCards({ filters, lang, sort });

  res.json(cards);
}
