-- CreateEnum
CREATE TYPE "OAuthProvider" AS ENUM ('GOOGLE');

-- CreateTable
CREATE TABLE "user_oauth_account" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "provider" "OAuthProvider" NOT NULL,
    "provider_account_id" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_oauth_account_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "idx_user_oauth_account_user_id" ON "user_oauth_account"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "uq_user_oauth_account_provider_account" ON "user_oauth_account"("provider", "provider_account_id");

-- AddForeignKey
ALTER TABLE "user_oauth_account" ADD CONSTRAINT "user_oauth_account_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
