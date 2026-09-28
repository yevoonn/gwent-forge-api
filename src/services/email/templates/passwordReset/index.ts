import { getPasswordResetEmailTemplate as getTemplateEN } from "./en.js";
import { getPasswordResetEmailTemplate as getTemplateIT } from "./it.js";
import { getPasswordResetEmailTemplate as getTemplatePL } from "./pl.js";

export type PasswordResetEmailLanguage = "en" | "pl" | "it";

interface PasswordResetEmailTemplateInput {
  resetUrl: string;
  year: number;
}

export function getPasswordResetEmailTemplate(
  lang: PasswordResetEmailLanguage,
  input: PasswordResetEmailTemplateInput,
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
