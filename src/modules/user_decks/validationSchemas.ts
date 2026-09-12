import { z } from "zod";

/**
 * Schema used when creating a new user deck.
 * The name/description are provided once and copied to every
 * system language on the backend side.
 */
export const createUserDeckSchema = z.object({
  deckId: z.number().int().positive(),
  name: z
    .string()
    .trim()
    .min(1, "Deck name is required")
    .max(255, "Deck name is too long"),
  description: z
    .string()
    .trim()
    .max(2000, "Description is too long")
    .optional(),
  cardCodes: z
    .array(z.string().trim().min(1))
    .min(1, "A deck must contain at least one card")
    .max(200, "Too many cards in a single deck"),
});

/**
 * Schema used when updating an existing user deck.
 * `lang` identifies which translation the name/description update applies to.
 * cardCodes, when present, fully replaces the deck's current card set.
 */
export const updateUserDeckSchema = z
  .object({
    lang: z.string().trim().min(1).optional(),
    name: z
      .string()
      .trim()
      .min(1, "Deck name is required")
      .max(255, "Deck name is too long")
      .optional(),
    description: z
      .string()
      .trim()
      .max(2000, "Description is too long")
      .optional(),
    cardCodes: z
      .array(z.string().trim().min(1))
      .min(1, "A deck must contain at least one card")
      .max(200, "Too many cards in a single deck")
      .optional(),
  })
  .refine((data) => !(data.name !== undefined && !data.lang), {
    message: "lang is required when updating name",
    path: ["lang"],
  })
  .refine((data) => !(data.description !== undefined && !data.lang), {
    message: "lang is required when updating description",
    path: ["lang"],
  });

export type CreateUserDeckInput = z.infer<typeof createUserDeckSchema>;
export type UpdateUserDeckInput = z.infer<typeof updateUserDeckSchema>;
