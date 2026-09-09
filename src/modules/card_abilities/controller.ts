import type { Request, Response } from "express";
import { findCardAbilities } from "./service.js";
import { parseQueryArray } from "../../utils/query.js";
import type { CardAbilityFilters } from "./query.js";

export async function getCardAbilities(
  req: Request,
  res: Response,
): Promise<void> {
  const lang = (req.query.lang as string | undefined) ?? "en";
  const sort = (req.query.sort as string | undefined) ?? "code_asc";
  const isSpecial =
    req.query.is_special === "true"
      ? true
      : req.query.is_special === "false"
        ? false
        : undefined;

  const filters: CardAbilityFilters = {
    search: req.query.search as string | undefined,
    lang,
    codes: parseQueryArray(req.query.code),
    is_special: isSpecial,
  };

  const cardAbilities = await findCardAbilities({ filters, lang, sort });

  res.json(cardAbilities);
}
