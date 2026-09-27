import { getVerificationEmailTemplate as getTemplateEN } from "./en.js";
import { getVerificationEmailTemplate as getTemplateIT } from "./it.js";
import { getVerificationEmailTemplate as getTemplatePL } from "./pl.js";

export type VerificationEmailLanguage = "en" | "pl" | "it";

interface VerificationEmailTemplateInput {
  verificationUrl: string;
  year: number;
}

export function getVerificationEmailTemplate(
  lang: VerificationEmailLanguage,
  input: VerificationEmailTemplateInput,
) {
  switch (lang) {
    case "pl":
      return getTemplatePL(input);
    case "it":
      return getTemplateIT(input);
    case "en":
    default:
      return getTemplateEN(input);
  }
}
