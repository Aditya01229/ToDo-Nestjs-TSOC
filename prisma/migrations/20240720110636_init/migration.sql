/*
  Warnings:

  - The values [NONE] on the enum `ToDoStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "ToDoStatus_new" AS ENUM ('DONE', 'ACTIVE');
ALTER TABLE "Todo" ALTER COLUMN "status" TYPE "ToDoStatus_new" USING ("status"::text::"ToDoStatus_new");
ALTER TYPE "ToDoStatus" RENAME TO "ToDoStatus_old";
ALTER TYPE "ToDoStatus_new" RENAME TO "ToDoStatus";
DROP TYPE "ToDoStatus_old";
COMMIT;
