export function mapDecks(decks) {
  return decks.map((deck) => ({
    code: deck.code,
    name: deck.deck_translation[0]?.name ?? null,
  }));
}
