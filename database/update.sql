-- ==========================================
-- DECK TRANSLATION
-- ==========================================
UPDATE deck_translation
SET
  "name" = 'Potwory',
  description = 'Mocną stroną frakcji potworów jest braterstwo. Dzięki tej zdolności można szybko przywołać na pole bitwy chmary potworów.'
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
  description = 'The Monsters faction relies heavily on the "Muster" ability which allows swarms of monsters to be quickly summoned to the battlefield.'
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
  description = 'La fazione dei Mostri fa largo uso dell''abilità "Adunata", che consente di evocare rapidamente degli sciami di mostri sul campo di battaglia.'
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
  description = 'Frakcja Nilfgaardu ma dużo jednostek ze zdolnościami szpiegostwa i wskrzeszenia, które za sprawą podstępu i strategii pozwalają graczowi zdobyć przewagę nad przeciwnikiem.'
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
  description = 'The Nilfgaard faction has many "Spy" and "Medic" cards which use underhanded tactics to achieve card advantage over the opponent.'
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
  description = 'La fazione di Nilfgaard vanta molte carte Spia e Medico, che fanno uso di subdole strategie per ottenere un vantaggio sull''avversario.'
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
  description = 'Frakcja Królestw Północy ma dużo jednostek ze zdolnością więzi, dzięki której mogą się wzajemnie wzmacniać na polu bitwy.'
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
  description = 'The Northern Realms faction has many units with "Tight Bond" which allows them to empower each other on the battlefield.'
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
  description = 'La fazione dei Regni Settentrionali dispone di molte unità con "Vincolo", che possono potenziarsi a vicenda sul campo di battaglia.'
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
  description = 'Frakcja Scoia''tael wyróżnia się zręcznością. Wiele jednostek pozwala wybierać między rzędem bliskiego starcia a rzędem dalekiego zasięgu, co zapewnia frakcji dużą elastyczność na polu bitwy.'
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
  description = 'The Scoia''tael faction hosts a lot of "Agile" cards which allow flexibility on the Close Combat and Ranged Combat rows of the battlefield.'
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
  description = 'La fazione di Scoia''tael dispone di molte carte con "Agilità", che possono essere schierate sia nella fila del combattimento ravvicinato che di quello a distanza.'
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
  description = 'Frakcja Skellige ma w swoich szeregach berserkerów, którzy potrafią się przemieniać w potężne jednostki.'
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
  description = 'The Skellige faction has "Berserkers" which channel their inner monster to transform into more powerful cards.'
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
  description = 'La fazione di Skellige dispone di carte con "Berserker", in grado di scatenare il proprio mostro interiore e trasformarsi in carte più potenti.'
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

-- ==========================================
-- DECK ABILITY TRANSLATION
-- ==========================================
UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'MONSTERS'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'MONSTERS'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'MONSTERS'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NILFGAARD'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NILFGAARD'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NILFGAARD'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NORTHERN_REALMS'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NORTHERN_REALMS'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'NORTHERN_REALMS'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SCOIATAEL'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SCOIATAEL'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SCOIATAEL'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SKELLIGE'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SKELLIGE'
  );

UPDATE deck_ability_translation
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
  AND deck_ability_id = (
    SELECT
      id
    FROM
      deck_ability
    WHERE
      code = 'SKELLIGE'
  );

-- ==========================================
-- CARD TYPE TRANSLATION
-- ==========================================
UPDATE card_type_translation
SET
  "name" = 'Bohater'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'HERO'
  );

UPDATE card_type_translation
SET
  "name" = 'Hero'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'HERO'
  );

UPDATE card_type_translation
SET
  "name" = 'Eroe'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'HERO'
  );

UPDATE card_type_translation
SET
  "name" = 'Dowódca'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'LEADER'
  );

UPDATE card_type_translation
SET
  "name" = 'Leader'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'LEADER'
  );

UPDATE card_type_translation
SET
  "name" = 'Comandante'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'LEADER'
  );

UPDATE card_type_translation
SET
  "name" = 'Specjalna'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'SPECIAL'
  );

UPDATE card_type_translation
SET
  "name" = 'Special'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'SPECIAL'
  );

UPDATE card_type_translation
SET
  "name" = 'Speciali'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'SPECIAL'
  );

UPDATE card_type_translation
SET
  "name" = 'Jednostka'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'UNIT'
  );

UPDATE card_type_translation
SET
  "name" = 'Unit'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'UNIT'
  );

UPDATE card_type_translation
SET
  "name" = 'Unità'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_type_id = (
    SELECT
      id
    FROM
      card_type
    WHERE
      code = 'UNIT'
  );