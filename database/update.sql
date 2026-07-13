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

-- ==========================================
-- CARD RANGE TRANSLATION
-- ==========================================
UPDATE card_range_translation
SET
  "name" = 'Zręczność',
  description = 'Zagraj kartę z tą zdolnością do rzędu bliskiego starcia albo do rzędu dalekiego zasięgu. Po zagraniu tej karty nie można jej przesunąć do innego rzędu.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'AGILE'
  );

UPDATE card_range_translation
SET
  "name" = 'Agile',
  description = 'Place on either the Close Combat or Ranged Combat row. Cannot be moved once placed.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'AGILE'
  );

UPDATE card_range_translation
SET
  "name" = 'Agilità',
  description = 'Schierabile sia nella fila del combattimento ravvicinato che a distanza. Una volta schierata, la carta non può essere spostata.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'AGILE'
  );

UPDATE card_range_translation
SET
  "name" = 'Bliskie starcie'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'CLOSE'
  );

UPDATE card_range_translation
SET
  "name" = 'Close Combat'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'CLOSE'
  );

UPDATE card_range_translation
SET
  "name" = 'Combattimento ravvicinato'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'CLOSE'
  );

UPDATE card_range_translation
SET
  "name" = 'Daleki zasięg'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'RANGED'
  );

UPDATE card_range_translation
SET
  "name" = 'Ranged Combat'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'RANGED'
  );

UPDATE card_range_translation
SET
  "name" = 'Combattimento a Distanza'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'RANGED'
  );

UPDATE card_range_translation
SET
  "name" = 'Oblężenie'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'SIEGE'
  );

UPDATE card_range_translation
SET
  "name" = 'Siege Combat'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'SIEGE'
  );

UPDATE card_range_translation
SET
  "name" = 'Assedio'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_range_id = (
    SELECT
      id
    FROM
      card_range
    WHERE
      code = 'SIEGE'
  );

-- ==========================================
-- CARD ABILITY RELATIONSHIP
-- ==========================================
UPDATE card_ability_relationship
SET
  card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SUMMON'
  )
WHERE
  card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'AVENGER'
  );

-- ==========================================
-- CARD ABILITY TRANSLATION
-- ==========================================
UPDATE card_ability_translation
SET
  "name" = 'Berserker',
  description = 'Zagraj odpowiednią kartę z talii pobocznej i usuń kartę z tą zdolnością z rozgrywki (nie odkładaj jej na stos kart odrzuconych).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BERSERKER'
  );

UPDATE card_ability_translation
SET
  "name" = 'Berserker',
  description = 'The specified card is played from the side deck, while the "Berserker" is removed from the game entirely (not sent to the discard pile).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BERSERKER'
  );

UPDATE card_ability_translation
SET
  "name" = 'Berserker',
  description = 'La carta specificata viene giocata dal mazzo supplementare e il "Berserker” viene completamente rimosso dal gioco (non viene mandato nella pila degli scarti).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BERSERKER'
  );

UPDATE card_ability_translation
SET
  "name" = 'Więź',
  description = 'Pomnóż siłę karty z tą zdolnością przez liczbę sojuszniczych kart jednostek o tej samej nazwie.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BOND'
  );

UPDATE card_ability_translation
SET
  "name" = 'Tight bond',
  description = 'Multiply the Strength of this Unit by the number of allies with the same name.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BOND'
  );

UPDATE card_ability_translation
SET
  "name" = 'Vincolo',
  description = 'Moltiplica la Forza di questa Unità per il numero di alleati con lo stesso nome. '
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'BOND'
  );

UPDATE card_ability_translation
SET
  "name" = 'Czyste niebo',
  description = 'Odrzuć tę kartę po zagraniu. Odrzuć wszystkie karty pogody znajdujące się aktualnie w grze. Ich efekty zostają anulowane.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'CLEAR'
  );

UPDATE card_ability_translation
SET
  "name" = 'Clear weather',
  description = 'Discard after playing. Discard all Weather cards currently on the battlefield. Their effects are cancelled.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'CLEAR'
  );

UPDATE card_ability_translation
SET
  "name" = 'Clima Sereno',
  description = 'Scartala dopo averla giocata. Scarta tutte le carte Clima che si trovano sul campo di battaglia al momento. I loro effetti vengono annullati.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'CLEAR'
  );

UPDATE card_ability_translation
SET
  "name" = 'Manekin do ćwiczeń',
  description = 'Zastąp tą kartą 1 ze swoich kart jednostek na polu bitwy (nie może to być karta bohatera). Weź tę kartę jednostki z powrotem na rękę. Siła Manekina do ćwiczeń wynosi 0.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'DECOY'
  );

UPDATE card_ability_translation
SET
  "name" = 'Decoy',
  description = 'Replace one Unit Card, excluding Heroes, on the controlling player''s side of the battlefield. The replaced Unit Card returns to the player''s hand, though the Decoy has a Strength value of 0.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'DECOY'
  );

UPDATE card_ability_translation
SET
  "name" = 'Esca',
  description = 'Sostituisce una carta Unità, a eccezione degli Eroi, sul lato del campo di battaglia del proprietario. La carta Unità sostituita torna nella mano del giocatore, ma l''Esca avrà un punteggio di Forza pari a 0.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'DECOY'
  );

UPDATE card_ability_translation
SET
  "name" = 'Gęsta mgła',
  description = 'Zagraj tę kartę odkrytą na pole kart pogody. Siła wszystkich jednostek dalekiego zasięgu obojga graczy wynosi 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FOG'
  );

UPDATE card_ability_translation
SET
  "name" = 'Impenetrable fog',
  description = 'Place face up in the Weather cards area. Sets the Strength of all range combat Units to 1 for both players.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FOG'
  );

UPDATE card_ability_translation
SET
  "name" = 'Nebbia Impenetrabile',
  description = 'Posizionala rivolta verso l''alto nell''area delle carte Clima. Imposta il punteggio di Forza di tutte le Unità da combattimento a distanza per entrambi i giocatori a 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FOG'
  );

UPDATE card_ability_translation
SET
  "name" = 'Trzaskający mróz',
  description = 'Zagraj tę kartę odkrytą na pole kart pogody. Siła wszystkich jednostek bliskiego starcia obojga graczy wynosi 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FROST'
  );

UPDATE card_ability_translation
SET
  "name" = 'Biting frost',
  description = 'Place face up in the Weather cards area. Sets the Strength of all close combat Units to 1 for both players.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FROST'
  );

UPDATE card_ability_translation
SET
  "name" = 'Morsa del Gelo',
  description = 'Posizionala rivolta verso l''alto nell''area delle carte Clima. Imposta il punteggio di Forza di tutte le Unità da combattimento ravvicinato per entrambi i giocatori a 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'FROST'
  );

UPDATE card_ability_translation
SET
  "name" = 'Róg dowódcy',
  description = 'Karta z tą zdolnością podwaja siłę wszystkich kart jednostek w rzędzie, w którym się znajduje, chyba że w tym rzędzie znajduje się już karta "Róg dowódcy".'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'HORN'
  );

UPDATE card_ability_translation
SET
  "name" = 'Commander''s horn',
  description = 'Double the Strength of all other Unit Cards on this card''s row, unless there is already a "Commander''s horn" card affecting this row.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'HORN'
  );

UPDATE card_ability_translation
SET
  "name" = 'Corno del Comandante',
  description = 'Raddoppia la Forza di tutte le altre carte Unità nella fila della carta, a meno che non ci sia già una carta "Corno del Comandante" che influenza questa fila.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'HORN'
  );

UPDATE card_ability_translation
SET
  "name" = 'Mardroeme',
  description = 'Karta z tą zdolnością powoduje przemianę wszystkich kart ze zdolnością berserkera w rzędzie, w którym się znajduje.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MARDROEME'
  );

UPDATE card_ability_translation
SET
  "name" = 'Mardroeme',
  description = 'Triggers the transformation of all "Berserker" cards on its row.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MARDROEME'
  );

UPDATE card_ability_translation
SET
  "name" = 'Mardroeme',
  description = 'Attiva la trasformazione di tutte le carte Berserker nella sua fila.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MARDROEME'
  );

UPDATE card_ability_translation
SET
  "name" = 'Wskrzeszenie',
  description = 'Przejrzyj swój stos kart odrzuconych i wybierz 1 kartę jednostki (nie może to być karta bohatera). Natychmiast zagraj tę kartę.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MEDIC'
  );

UPDATE card_ability_translation
SET
  "name" = 'Medic',
  description = 'Choose one Unit Card in the discard pile, excluding Heroes, and play it immediately.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MEDIC'
  );

UPDATE card_ability_translation
SET
  "name" = 'Medico',
  description = 'Scegli una carta Unità dalla pila degli scarti, fatta eccezione per gli Eroi, e schierala immediatamente.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MEDIC'
  );

UPDATE card_ability_translation
SET
  "name" = 'Wysokie morale',
  description = 'Karta z tą zdolnością zwiększa o 1 siłę wszystkich pozostałych kart jednostek znajdujących się w tym samym rzędzie, w którym się znajduje (nie zwiększa swojej siły).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MORALE'
  );

UPDATE card_ability_translation
SET
  "name" = 'Morale boost',
  description = 'Add 1 Strength to all units on the row (excluding itself).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MORALE'
  );

UPDATE card_ability_translation
SET
  "name" = 'Morale',
  description = 'Aggiunge 1 di Forza a tutte le unità nella fila (a eccezione di sé).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MORALE'
  );

UPDATE card_ability_translation
SET
  "name" = 'Braterstwo',
  description = 'Przejrzyj swoją talię i rękę, odszukaj wszystkie karty wskazane na tej karcie i natychmiast je zagraj. Następnie potasuj talię.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MUSTER'
  );

UPDATE card_ability_translation
SET
  "name" = 'Muster',
  description = 'Find all specified cards in the hand and deck and play them immediately, then shuffle the deck.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MUSTER'
  );

UPDATE card_ability_translation
SET
  "name" = 'Adunata',
  description = 'Cerca tutte le carte specifiche nella mano e nel mazzo e giocale immediatamente. Dopodiché, mischia il mazzo.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'MUSTER'
  );

UPDATE card_ability_translation
SET
  "name" = 'Ulewny deszcz',
  description = 'Zagraj tę kartę odkrytą na pole kart pogody. Siła wszystkich jednostek oblężniczych obojga graczy wynosi 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'RAIN'
  );

UPDATE card_ability_translation
SET
  "name" = 'Torrential rain',
  description = 'Place face up in the Weather cards area. Sets the Strength of all siege combat Units to 1 for both players.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'RAIN'
  );

UPDATE card_ability_translation
SET
  "name" = 'Pioggia Torrenziale',
  description = 'Posizionala rivolta verso l''alto nell''area delle carte Clima. Imposta il punteggio di Forza di tutte le Unità da combattimento d''assedio per entrambi i giocatori a 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'RAIN'
  );

UPDATE card_ability_translation
SET
  "name" = 'Pożoga',
  description = 'Odrzuć najsilniejszą kartę (albo karty) jednostki na całym polu bitwy (nie może to być karta bohatera). Odrzuć tę kartę po zagraniu. Ten efekt dotyczy pola bitwy obu graczy.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH'
  );

UPDATE card_ability_translation
SET
  "name" = 'Scorch',
  description = 'Send to the discard pile the Unit Card(s) with the highest Strength, excluding Heroes, on the entire battlefield, then discard self. This includes both player''s sides of the board.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH'
  );

UPDATE card_ability_translation
SET
  "name" = 'Ustione',
  description = 'Manda nella pila degli scarti la o le carte Unità col punteggio di Forza maggiore di tutto il campo di battaglia, a eccezione degli Eroi, per poi essere scartata a sua volta. Influenza i lati di entrambi i giocatori.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH'
  );

UPDATE card_ability_translation
SET
  "name" = 'Pożoga',
  description = 'Jeśli całkowita siła w rzędzie przeciwnika odpowiadającym rzędowi, do którego zagrano kartę z tą zdolnością, wynosi 10 albo więcej, odrzuć najsilniejszą kartę (albo karty) jednostki przeciwnika w tym rzędzie (nie może to być karta bohatera).'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH_ROW'
  );

UPDATE card_ability_translation
SET
  "name" = 'Scorch',
  description = 'If the opponent has a total Strength of 10 or higher on the row opposite this card, the Unit Card(s) with the highest Strength, excluding Heroes, are sent to the discard pile.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH_ROW'
  );

UPDATE card_ability_translation
SET
  "name" = 'Ustione',
  description = 'Se l''avversario ha un punteggio di Forza di 10 o superiore nella fila opposta a questa carta, la o le carte Unità col punteggio di Forza maggiore, a eccezione degli Eroi, sono mandate nella pila degli scarti.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SCORCH_ROW'
  );

UPDATE card_ability_translation
SET
  "name" = 'Szpiegostwo',
  description = 'Zagraj kartę z tą zdolnością na pole bitwy po stronie przeciwnika (liczy się do jego całkowitej siły) i dobierz 2 karty ze swojej talii.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SPY'
  );

UPDATE card_ability_translation
SET
  "name" = 'Spy',
  description = 'Play onto the opponent''s battlefield (with its Strength counting towards the opponent''s total) and draw two cards from the deck.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SPY'
  );

UPDATE card_ability_translation
SET
  "name" = 'Spia',
  description = 'Gioca la carta nel campo di battaglia dell''avversario (la sua Forza contribuisce al punteggio dell''avversario) e pesca due carte dal mazzo'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SPY'
  );

UPDATE card_ability_translation
SET
  "name" = 'Skelligijski sztorm',
  description = 'Zagraj tę kartę odkrytą na pole kart pogody. Siła wszystkich jednostek dalekiego zasięgu i oblężniczych obojga graczy wynosi 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'STORM'
  );

UPDATE card_ability_translation
SET
  "name" = 'Skellige storm',
  description = 'Place face up in the Weather cards area. Sets the Strength of all ranged combat and siege combat Units to 1 for both players.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'STORM'
  );

UPDATE card_ability_translation
SET
  "name" = 'Tempesta delle Skellige',
  description = 'Posizionala rivolta verso l''alto nell''area delle carte Clima. Imposta il punteggio di Forza di tutte le Unità da combattimento a distanza e d''assedio per entrambi i giocatori a 1.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'STORM'
  );

UPDATE card_ability_translation
SET
  "name" = 'Wezwanie z zaświatów',
  description = 'Gdy karta z tą zdolnością zostanie z jakiegoś powodu odrzucona z pola bitwy (także na koniec rundy), jej miejsce zajmuje odpowiednia karta z talii pobocznej.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SUMMON'
  );

UPDATE card_ability_translation
SET
  "name" = 'Summon',
  description = 'When this card is discarded from the battlefield in any instance (including at the end of a round) it is replaced with the corresponding card from the side deck.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'en'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SUMMON'
  );

UPDATE card_ability_translation
SET
  "name" = 'Evocazione',
  description = 'Quando questa carta viene scartata dal campo di battaglia per qualsiasi motivo (anche alla fine di un round), viene sostituita dalla carta corrispondente del mazzo supplementare.'
WHERE
  language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'it'
  )
  AND card_ability_id = (
    SELECT
      id
    FROM
      card_ability
    WHERE
      code = 'SUMMON'
  );

-- ==========================================
-- CARD TRANSLATION - PL
-- ==========================================
UPDATE card_translation
SET
  "name" = 'Eredin Bréacc Glas, Zdradziecki'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON001'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Eredin Bréacc Glas, Zabójca Auberona'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON002'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Eredin Bréacc Glas, Dowódca Czerwonych Jeźdźców'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON003'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Eredin Bréacc Glas, Władca Tir ná Lia'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON004'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Eredin Bréacc Glas, Król Dzikiego Gonu'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON005'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Avallac''h'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON006'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Cirilla'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON007'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Draug'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON008'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Geralt z Rivii'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON009'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Imlerith'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON010'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Kejran'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON011'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Leszy'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON012'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Triss Merigold'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON013'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Yennefer z Vengerbergu'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON014'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Krabopająk'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON015'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Krabopająk'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON016'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Krabopająk'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON017'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Olbrzymi krabopająk'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON018'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Poroniec'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON019'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Bydlęce siły zbrojne'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON020_1_2'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Bydlęce siły zbrojne'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON020_2_2'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Harpia Celaeno'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON021'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Kuroliszek'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON022'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Krowa'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON023'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wiedźma: Szepciucha'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON024'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wiedźma: Prządka'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON025'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wiedźma: Kuchta'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON026'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Jaskier'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON027'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Żywiołak ziemi'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON028'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Emiel Regis Rohellec Terzieff'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON029'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Endriaga'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON030'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Bies'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON031'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Żywiołak ognia'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON032'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Mglak'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON033'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Widłogon'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON034'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Przeraza'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON035'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gargulec'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON036'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gaunter O''Dim'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON037'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gaunter O''Dim: Cień'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON038_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gaunter O''Dim: Cień'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON038_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gaunter O''Dim: Cień'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON038_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Ghul'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON039'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Ghul'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON040'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Ghul'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON041'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Baba cmentarna'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON042'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gryf'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON043'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Harpia'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON044'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Lodowy gigant'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON045'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Nekker'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON046'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Nekker'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON047'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Nekker'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON048'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Olgierd von Everec'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON049'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Morowa dziewica'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON050'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Płotka'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON051'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Królewicz Ropuch'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON052'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wampir: Bruxa'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON053'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wampir: Ekimma'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON054'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wampir: Fleder'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON055'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wampir: Garkain'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON056'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wampir: Katakan'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON057'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Vesemir'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON058'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Villentretenmerth'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON059'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wilkołak'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON060'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Wiwerna'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON061'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Zoltan Chivay'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON062'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Trzaskający mróz'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON063_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Trzaskający mróz'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON063_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Trzaskający mróz'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON063_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Czyste niebo'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON064_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Czyste niebo'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON064_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Czyste niebo'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON064_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Róg dowódcy'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON065_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Róg dowódcy'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON065_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Róg dowódcy'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON065_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Manekin do ćwiczeń'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON066_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Manekin do ćwiczeń'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON066_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Manekin do ćwiczeń'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON066_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gęsta mgła'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON067_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gęsta mgła'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON067_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Gęsta mgła'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON067_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Pożoga'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON068_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Pożoga'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON068_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Pożoga'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON068_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Skelligijski sztorm'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON069_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Skelligijski sztorm'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON069_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Skelligijski sztorm'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON069_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Ulewny deszcz'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON070_1_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Ulewny deszcz'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON070_2_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );

UPDATE card_translation
SET
  "name" = 'Ulewny deszcz'
WHERE
  card_id = (
    SELECT
      id
    FROM
      card
    WHERE
      code = 'MON070_3_3'
  )
  AND language_id = (
    SELECT
      id
    FROM
      "language"
    WHERE
      code = 'pl'
  );