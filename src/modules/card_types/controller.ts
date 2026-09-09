import type { Request, Response } from "express";
import { findCardTypes } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";
import type { CardTypeFilters } from "./query.js";

export async function getCardTypes(req: Request, res: Response): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const sort = (req.query.sort as string | undefined) ?? "code_asc";

  const filters: CardTypeFilters = {
    search: req.query.search as string | undefined,
    lang,
    codes: parseQueryArray(req.query.code),
  };

  const cardTypes = await findCardTypes({ filters, lang, sort });

  res.json(cardTypes);
}
