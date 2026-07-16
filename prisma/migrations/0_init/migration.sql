-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateTable
CREATE TABLE "card" (
    "id" SERIAL NOT NULL,
    "deck_id" INTEGER NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "power" INTEGER,
    "type_id" INTEGER NOT NULL,
    "range_id" INTEGER,
    "image_url" VARCHAR(255),
    "is_deck_card" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "card_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_ability" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,

    CONSTRAINT "card_ability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_ability_relationship" (
    "card_id" INTEGER NOT NULL,
    "card_ability_id" INTEGER NOT NULL,

    CONSTRAINT "pk_card_ability_relationship" PRIMARY KEY ("card_id","card_ability_id")
);

-- CreateTable
CREATE TABLE "card_ability_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "card_ability_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "card_ability_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_range" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,

    CONSTRAINT "card_range_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_range_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "card_range_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "card_range_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "card_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "card_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_type" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,

    CONSTRAINT "card_type_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "card_type_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "card_type_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "card_type_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deck" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "game_id" INTEGER NOT NULL,
    "ability_id" INTEGER,

    CONSTRAINT "deck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deck_ability" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,

    CONSTRAINT "deck_ability_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deck_ability_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "deck_ability_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "deck_ability_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "deck_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "deck_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "deck_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "game" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,

    CONSTRAINT "game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "game_translation" (
    "id" SERIAL NOT NULL,
    "language_id" INTEGER NOT NULL,
    "game_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "game_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "language" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(5) NOT NULL,
    "name" VARCHAR(50) NOT NULL,

    CONSTRAINT "language_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "card_code_key" ON "card"("code");

-- CreateIndex
CREATE INDEX "idx_card_deck_id" ON "card"("deck_id");

-- CreateIndex
CREATE INDEX "idx_card_range_id" ON "card"("range_id");

-- CreateIndex
CREATE INDEX "idx_card_type_id" ON "card"("type_id");

-- CreateIndex
CREATE UNIQUE INDEX "card_ability_code_key" ON "card_ability"("code");

-- CreateIndex
CREATE INDEX "idx_card_ability_relationship_card_ability_id" ON "card_ability_relationship"("card_ability_id");

-- CreateIndex
CREATE INDEX "idx_card_ability_translation_ability_id" ON "card_ability_translation"("card_ability_id");

-- CreateIndex
CREATE INDEX "idx_card_ability_translation_language_id" ON "card_ability_translation"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_card_ability_translation" ON "card_ability_translation"("card_ability_id", "language_id");

-- CreateIndex
CREATE UNIQUE INDEX "card_range_code_key" ON "card_range"("code");

-- CreateIndex
CREATE INDEX "idx_card_range_translation_language_id" ON "card_range_translation"("language_id");

-- CreateIndex
CREATE INDEX "idx_card_range_translation_range_id" ON "card_range_translation"("card_range_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_card_range_translation" ON "card_range_translation"("card_range_id", "language_id");

-- CreateIndex
CREATE INDEX "idx_card_translation_card_id" ON "card_translation"("card_id");

-- CreateIndex
CREATE INDEX "idx_card_translation_language_id" ON "card_translation"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_card_translation" ON "card_translation"("card_id", "language_id");

-- CreateIndex
CREATE UNIQUE INDEX "card_type_code_key" ON "card_type"("code");

-- CreateIndex
CREATE INDEX "idx_card_type_translation_language_id" ON "card_type_translation"("language_id");

-- CreateIndex
CREATE INDEX "idx_card_type_translation_type_id" ON "card_type_translation"("card_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_card_type_translation" ON "card_type_translation"("card_type_id", "language_id");

-- CreateIndex
CREATE UNIQUE INDEX "deck_code_key" ON "deck"("code");

-- CreateIndex
CREATE INDEX "idx_deck_ability_id" ON "deck"("ability_id");

-- CreateIndex
CREATE INDEX "idx_deck_game_id" ON "deck"("game_id");

-- CreateIndex
CREATE UNIQUE INDEX "deck_ability_code_key" ON "deck_ability"("code");

-- CreateIndex
CREATE INDEX "idx_deck_ability_translation_ability_id" ON "deck_ability_translation"("deck_ability_id");

-- CreateIndex
CREATE INDEX "idx_deck_ability_translation_language_id" ON "deck_ability_translation"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_deck_ability_translation" ON "deck_ability_translation"("deck_ability_id", "language_id");

-- CreateIndex
CREATE INDEX "idx_deck_translation_deck_id" ON "deck_translation"("deck_id");

-- CreateIndex
CREATE INDEX "idx_deck_translation_language_id" ON "deck_translation"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_deck_translation" ON "deck_translation"("deck_id", "language_id");

-- CreateIndex
CREATE UNIQUE INDEX "game_code_key" ON "game"("code");

-- CreateIndex
CREATE INDEX "idx_game_translation_game_id" ON "game_translation"("game_id");

-- CreateIndex
CREATE INDEX "idx_game_translation_language_id" ON "game_translation"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_game_translation" ON "game_translation"("game_id", "language_id");

-- CreateIndex
CREATE UNIQUE INDEX "language_code_key" ON "language"("code");

-- AddForeignKey
ALTER TABLE "card" ADD CONSTRAINT "fk_card_deck" FOREIGN KEY ("deck_id") REFERENCES "deck"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card" ADD CONSTRAINT "fk_card_range" FOREIGN KEY ("range_id") REFERENCES "card_range"("id") ON DELETE SET NULL ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card" ADD CONSTRAINT "fk_card_type" FOREIGN KEY ("type_id") REFERENCES "card_type"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_ability_relationship" ADD CONSTRAINT "fk_car_ability" FOREIGN KEY ("card_ability_id") REFERENCES "card_ability"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_ability_relationship" ADD CONSTRAINT "fk_car_card" FOREIGN KEY ("card_id") REFERENCES "card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_ability_translation" ADD CONSTRAINT "fk_card_ability_translation_ability" FOREIGN KEY ("card_ability_id") REFERENCES "card_ability"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_ability_translation" ADD CONSTRAINT "fk_card_ability_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_range_translation" ADD CONSTRAINT "fk_card_range_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_range_translation" ADD CONSTRAINT "fk_card_range_translation_range" FOREIGN KEY ("card_range_id") REFERENCES "card_range"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_translation" ADD CONSTRAINT "fk_card_translation_card" FOREIGN KEY ("card_id") REFERENCES "card"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_translation" ADD CONSTRAINT "fk_card_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_type_translation" ADD CONSTRAINT "fk_card_type_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "card_type_translation" ADD CONSTRAINT "fk_card_type_translation_type" FOREIGN KEY ("card_type_id") REFERENCES "card_type"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deck" ADD CONSTRAINT "fk_deck_ability" FOREIGN KEY ("ability_id") REFERENCES "deck_ability"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deck" ADD CONSTRAINT "fk_deck_game" FOREIGN KEY ("game_id") REFERENCES "game"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deck_ability_translation" ADD CONSTRAINT "fk_deck_ability_translation_ability" FOREIGN KEY ("deck_ability_id") REFERENCES "deck_ability"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deck_ability_translation" ADD CONSTRAINT "fk_deck_ability_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deck_translation" ADD CONSTRAINT "fk_deck_translation_deck" FOREIGN KEY ("deck_id") REFERENCES "deck"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "deck_translation" ADD CONSTRAINT "fk_deck_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "game_translation" ADD CONSTRAINT "fk_game_translation_game" FOREIGN KEY ("game_id") REFERENCES "game"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "game_translation" ADD CONSTRAINT "fk_game_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

