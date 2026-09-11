-- CreateTable
CREATE TABLE "user_deck" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "deck_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_deck_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_deck_translation" (
    "id" SERIAL NOT NULL,
    "user_deck_id" INTEGER NOT NULL,
    "language_id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,

    CONSTRAINT "user_deck_translation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_deck_card" (
    "user_deck_id" INTEGER NOT NULL,
    "card_id" INTEGER NOT NULL,

    CONSTRAINT "pk_user_deck_card" PRIMARY KEY ("user_deck_id","card_id")
);

-- CreateIndex
CREATE INDEX "idx_user_deck_user_id" ON "user_deck"("user_id");

-- CreateIndex
CREATE INDEX "idx_user_deck_deck_id" ON "user_deck"("deck_id");

-- CreateIndex
CREATE INDEX "idx_user_deck_translation_deck_id" ON "user_deck_translation"("user_deck_id");

-- CreateIndex
CREATE INDEX "idx_user_deck_translation_language_id" ON "user_deck_translation"("language_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_user_deck_translation" ON "user_deck_translation"("user_deck_id", "language_id");

-- CreateIndex
CREATE INDEX "idx_user_deck_card_card_id" ON "user_deck_card"("card_id");

-- AddForeignKey
ALTER TABLE "user_deck" ADD CONSTRAINT "fk_user_deck_user" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_deck" ADD CONSTRAINT "fk_user_deck_deck" FOREIGN KEY ("deck_id") REFERENCES "deck"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_deck_translation" ADD CONSTRAINT "fk_user_deck_translation_deck" FOREIGN KEY ("user_deck_id") REFERENCES "user_deck"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_deck_translation" ADD CONSTRAINT "fk_user_deck_translation_language" FOREIGN KEY ("language_id") REFERENCES "language"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_deck_card" ADD CONSTRAINT "fk_user_deck_card_deck" FOREIGN KEY ("user_deck_id") REFERENCES "user_deck"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_deck_card" ADD CONSTRAINT "fk_user_deck_card_card" FOREIGN KEY ("card_id") REFERENCES "card"("id") ON DELETE CASCADE ON UPDATE CASCADE;
