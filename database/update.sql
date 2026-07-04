-- ==========================================
-- DECK TRANSLATION
-- ==========================================
UPDATE deck_translation
SET
  "name" = 'Potwory',
  description = 'Po każdej rundzie na polu bitwy zostaje 1 karta jednostki potworów. Aby ją wybrać, potasuj wszystkie swoje karty jednostek (bez kart bohaterów) z pola bitwy i wylosuj spośród nich 1 kartę. Umieść ją w odpowiednim rzędzie zgodnie z symbolem zasięgu jednostki.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'MONSTERS'
  );

UPDATE deck_translation
SET
  "name" = 'Monsters',
  description = 'One Unit Card stays on the battlefield after each round. To choose it, the controlling player shuffles all their Unit Cards on the battlefield, excluding Heroes, and draws one at random.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'MONSTERS'
  );

UPDATE deck_translation
SET
  "name" = 'Mostri',
  description = 'Dopo ogni round, resta una carta Unità sul campo di battaglia. Per sceglierla, chi gioca la fazione Mostri deve mescolare tutte le proprie carte Unità in campo, tranne gli Eroi, e pescarne una a caso.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'MONSTERS'
  );

UPDATE deck_translation
SET
  "name" = 'Nilfgaard',
  description = 'W razie remisu wygrywasz rundę'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NILFGAARD'
  );

UPDATE deck_translation
SET
  "name" = 'Nilfgaard',
  description = 'Wins the round whenever there is a draw.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NILFGAARD'
  );

UPDATE deck_translation
SET
  "name" = 'Nilfgaard',
  description = 'Fa vincere il round in caso di pareggio.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NILFGAARD'
  );

UPDATE deck_translation
SET
  "name" = 'Królestwa Północy',
  description = 'Dobierasz 1 kartę z talii po każdej wygranej rundzie.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NORTHERN_REALMS'
  );

UPDATE deck_translation
SET
  "name" = 'Northern Realms',
  description = 'Draws a card from the deck whenever a round is won.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NORTHERN_REALMS'
  );

UPDATE deck_translation
SET
  "name" = 'Regni Settentrionali',
  description = 'Ogni volta che viene vinto un round, pesca una carta dal mazzo.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'NORTHERN_REALMS'
  );

UPDATE deck_translation
SET
  "name" = 'Scoia''tael',
  description = 'Decydujesz, kto rozpoczyna rozgrywkę.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SCOIATAEL'
  );

UPDATE deck_translation
SET
  "name" = 'Scoia''tael',
  description = 'Decides who goes first at the start of the game.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SCOIATAEL'
  );

UPDATE deck_translation
SET
  "name" = 'Scoia''tael',
  description = 'Permette di decidere chi comincia per primo all''inizio della partita.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SCOIATAEL'
  );

UPDATE deck_translation
SET
  "name" = 'Skellige',
  description = 'Na początku 3. rundy umieszczasz na polu bitwy 2 losowe karty jednostek ze swojego stosu kart odrzuconych. Aby je wybrać, potasuj cały swój stos kart odrzuconych (bez kart bohaterów) i wylosuj spośród nich 2 karty.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SKELLIGE'
  );

UPDATE deck_translation
SET
  "name" = 'Skellige',
  description = 'At the start of the third round, two random Unit Cards, excluding Heroes, are taken from the controlling player''s discard pile and put on the battlefield. To choose these, shuffle the discard pile and choose two at random.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SKELLIGE'
  );

UPDATE deck_translation
SET
  "name" = 'Skellige',
  description = 'All''inizio del terzo round, due carte Unità, fatta eccezione per gli Eroi, vengono prelevate dalla pila degli scarti del giocatore interessato e schierate in campo. Per sceglierle, mescola la pila degli scarti e pescale in modo casuale.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND deck_id = (
    SELECT
      id
    FROM
      deck
    WHERE
      code = 'SKELLIGE'
  );