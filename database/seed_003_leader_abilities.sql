-- ==========================================
-- CARD ABILITY
-- ==========================================
INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_DOUBLE_SPY_POWER', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_RETURN_DISCARD_TO_HAND', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_HORN_CLOSE_ROW', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_DISCARD_AND_DRAW', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_WEATHER_FROM_DECK', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_TORRENTIAL_RAIN', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_RANDOMIZE_REVIVE', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_REVEAL_OPPONENT_HAND', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_STEAL_OPPONENT_DISCARD', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_CANCEL_LEADER_ABILITY', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_IMPENETRABLE_FOG', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_CLEAR_WEATHER', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_SCORCH_RANGED', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_HORN_SIEGE_ROW', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_SCORCH_SIEGE', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_DRAW_EXTRA_CARD', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_OPTIMIZE_AGILE_UNITS', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_BITING_FROST', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_SCORCH_CLOSE', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_HORN_RANGED_ROW', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_BOND_COPY', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_RESHUFFLE_GRAVEYARDS', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_SKELLIGE_STORM', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_PLAY_MARDROEME', true);

INSERT INTO
  card_ability (code, is_special)
VALUES
  ('LEADER_HALF_WEATHER_DAMAGE', true);

-- ==========================================
-- CARD ABILITY TRANSLATION
-- ==========================================
INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_DOUBLE_SPY_POWER'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'MON001'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN '(P) Podwaja siłę wszystkich kart ze zdolnością szpiegostwa (dotyczy obu graczy).'
    WHEN l.code IN ('en', 'it') THEN '(P) Doubles the strength of all spy cards (affects both players).'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_RETURN_DISCARD_TO_HAND'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'MON002'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Przywróć na rękę dowolną kartę ze swojego stosu kart odrzuconych.'
    WHEN l.code IN ('en', 'it') THEN 'Restore a card from your discard pile to your hand.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_HORN_CLOSE_ROW'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'MON003'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Podwaja siłę wszystkich Twoich jednostek bliskiego starcia (chyba że w ich rzędzie jest karta ze zdolnością rogu dowódcy).'
    WHEN l.code IN ('en', 'it') THEN 'Double the strength of all your Close Combat units (unless a Commander''s Horn is also present on that row).'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_DISCARD_AND_DRAW'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'MON004'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Odrzuć 2 karty, a następnie dobierz 1 dowolną kartę ze swojej talii.'
    WHEN l.code IN ('en', 'it') THEN 'Discard 2 cards and draw 1 card of your choice from your deck.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_WEATHER_FROM_DECK'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'MON005'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Wybierz kartę pogody ze swojej talii i natychmiast ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Pick any weather card from your deck and play it instantly.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_TORRENTIAL_RAIN'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NIL001'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Znajdź w swojej talii kartę Ulewny deszcz i natychmiast ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Pick a Torrential Rain card from your deck and play it instantly.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_RANDOMIZE_REVIVE'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NIL002'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN '(P) Zdolności, które przywracają jednostkę na pole bitwy, przywracają losową jednostkę ze stosu kart odrzuconych (dotyczy obu graczy).'
    WHEN l.code IN ('en', 'it') THEN '(P) Abilities that restore a unit to the battlefield restore a randomly-chosen unit. Affects both players.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_REVEAL_OPPONENT_HAND'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NIL003'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Obejrzyj 3 losowe karty z ręki przeciwnika.'
    WHEN l.code IN ('en', 'it') THEN 'Look at 3 random cards from your opponent''s hand.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_STEAL_OPPONENT_DISCARD'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NIL004'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Dobierz dowolną kartę ze stosu kart odrzuconych przeciwnika. Nie może to być karta bohatera.'
    WHEN l.code IN ('en', 'it') THEN 'Draw a card from your opponent''s discard pile. It cannot be a hero card.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_CANCEL_LEADER_ABILITY'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NIL005'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN '(P) Zablokuj zdolność dowódcy przeciwnika.'
    WHEN l.code IN ('en', 'it') THEN '(P) Cancel your opponent''s Leader Ability.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_IMPENETRABLE_FOG'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NOR001'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Znajdź w swojej talii kartę Gęsta mgła i natychmiast ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Pick an Impenetrable Fog card from your deck and play it instantly.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_CLEAR_WEATHER'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NOR002'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Odrzuć wszystkie karty pogody znajdujące się aktualnie w grze.'
    WHEN l.code IN ('en', 'it') THEN 'Clear any weather effects in play.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_SCORCH_RANGED'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NOR003'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Zniszcz najsilniejszą jednostkę (albo jednostki) dalekiego zasięgu przeciwnika, jeśli całkowita siła wszystkich jego jednostek dalekiego zasięgu wynosi 10 albo więcej.'
    WHEN l.code IN ('en', 'it') THEN 'Destroy your enemy''s strongest Ranged Combat unit(s) if the combined strength of all his or her Ranged Combat units is 10 or more.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_HORN_SIEGE_ROW'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NOR004'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Podwaja siłe wszystkich Twoich jednostek oblężniczych (chyba że w ich rzędzie jest karta ze zdolnością rogu dowódcy).'
    WHEN l.code IN ('en', 'it') THEN 'Doubles the strength of all your Siege units (unless a Commander''s Horn is also present on that row).'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_SCORCH_SIEGE'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'NOR005'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Zniszcz najsilniejszą jednostkę (albo jednostki) oblężniczą przeciwnika, jeśli całkowita siła wszystkich jego jednostek oblężniczych wynosi 10 albo więcej.'
    WHEN l.code IN ('en', 'it') THEN 'Destroy your enemy''s strongest Siege unit(s) if the combined strength of all his or her Siege units is 10 or more.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_DRAW_EXTRA_CARD'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SCO001'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Dobierz o 1 kartę więcej na początku rozgrywki.'
    WHEN l.code IN ('en', 'it') THEN 'Draw an extra card at the beginning of the battle.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_OPTIMIZE_AGILE_UNITS'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SCO002'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Przesuń jednostki ze zdolnością zręczności do tego z odpowiadających im rzędów, w którym będą miały najwyższą siłę (nie przesuwaj jednostek, które już zajmują najkorzystniejszą pozycję).'
    WHEN l.code IN ('en', 'it') THEN 'Move agile units to whichever valid row maximizes their strength (don''t move units already in optimal row).'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_BITING_FROST'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SCO003'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Znajdź w swojej talii kartę Trzaskający mróz i natychmiast ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Pick a Biting Frost card from your deck and play it instantly.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_SCORCH_CLOSE'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SCO004'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Zniszcz najsilniejszą jednostkę (albo jednostki) bliskiego starcia przeciwnika, jeśli całkowita siła wszystkich jego jednostek bliskiego starcia wynosi 10 albo więcej.'
    WHEN l.code IN ('en', 'it') THEN 'Destroy your enemy''s strongest Close Combat unit(s) if the combined strength of all his or her Close Combat units is 10 or more.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_HORN_RANGED_ROW'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SCO005'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Podwaja siłę wszystkich Twoich jednostek dalekiego zasięgu (chyba że w ich rzędzie jest karta ze zdolnością rogu dowódcy).'
    WHEN l.code IN ('en', 'it') THEN 'Doubles the strength of all your Ranged Combat units (unless a Commander''s Horn is also present on that row).'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_BOND_COPY'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SKE001'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Wybierz jednostkę ze zdolnością więzi po Twojej stronie pola bitwy. Znajdź w swojej talii 1 kartę tej samej jednostki i natychmist ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Choose a unit with the Bond ability on your side of the battlefield. Find 1 copy of that unit in your deck and play it immediately.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_RESHUFFLE_GRAVEYARDS'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SKE002'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Oboje graczy wtasowuje do swojej talii wszystkie karty ze stosu kart odrzuconych.'
    WHEN l.code IN ('en', 'it') THEN 'Shuffle all cards from each player''s graveyard back into their decks.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_SKELLIGE_STORM'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SKE003'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Znajdź w swojej talii kartę Skelligijski sztorm i natychmiast ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Pick a Skellige Storm card from your deck and play it instantly.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_PLAY_MARDROEME'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SKE004'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN 'Znajdź w swojej talii kartę Mardroeme i natychmiast ją zagraj.'
    WHEN l.code IN ('en', 'it') THEN 'Pick a Mardroeme card from your deck and play it instantly.'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

INSERT INTO
  card_ability_translation (language_id, card_ability_id, name, description)
SELECT
  l.id,
  (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'LEADER_HALF_WEATHER_DAMAGE'
  ),
  (
    SELECT
      name
    FROM
      card_translation ct
      JOIN card c ON c.id = ct.card_id
    WHERE
      c.code = 'SKE005'
      AND ct.language_id = l.id
  ),
  CASE
    WHEN l.code = 'pl' THEN '(P) Twoje jednostki tracą tylko połowę siły pod wpływem efektów kart pogody (zaokrąglij w dół).'
    WHEN l.code IN ('en', 'it') THEN '(P) Units only lose half their Strength in bad weather conditions (round down).'
  END
FROM
  language l
WHERE
  l.code IN ('pl', 'en', 'it');

-- ==========================================
-- CARD ABILITY RELATIONSHIP
-- ==========================================
INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'MON001'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_DOUBLE_SPY_POWER'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'MON002'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_RETURN_DISCARD_TO_HAND'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'MON003'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_HORN_CLOSE_ROW'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'MON004'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_DISCARD_AND_DRAW'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'MON005'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_WEATHER_FROM_DECK'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NIL001'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_TORRENTIAL_RAIN'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NIL002'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_RANDOMIZE_REVIVE'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NIL003'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_REVEAL_OPPONENT_HAND'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NIL004'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_STEAL_OPPONENT_DISCARD'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NIL005'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_CANCEL_LEADER_ABILITY'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NOR001'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_IMPENETRABLE_FOG'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NOR002'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_CLEAR_WEATHER'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NOR003'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_SCORCH_RANGED'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NOR004'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_HORN_SIEGE_ROW'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'NOR005'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_SCORCH_SIEGE'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SCO001'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_DRAW_EXTRA_CARD'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SCO002'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_OPTIMIZE_AGILE_UNITS'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SCO003'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_BITING_FROST'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SCO004'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_SCORCH_CLOSE'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SCO005'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_HORN_RANGED_ROW'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SKE001'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_BOND_COPY'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SKE002'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_RESHUFFLE_GRAVEYARDS'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SKE003'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_SKELLIGE_STORM'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SKE004'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_PLAY_MARDROEME'
    )
  );

INSERT INTO
  card_ability_relationship (card_id, card_ability_id)
VALUES
  (
    (
      SELECT
        id
      FROM
        card
      WHERE
        code = 'SKE005'
    ),
    (
      SELECT
        id
      FROM
        card_ability
      WHERE
        code = 'LEADER_HALF_WEATHER_DAMAGE'
    )
  );