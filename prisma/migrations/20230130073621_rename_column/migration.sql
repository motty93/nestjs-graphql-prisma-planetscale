/*
  Warnings:

  - You are about to drop the column `user_id` on the `Post` table. All the data in the column will be lost.
  - Added the required column `author_id` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Post` DROP COLUMN `user_id`,
    ADD COLUMN `author_id` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE INDEX `Post_author_id_idx` ON `Post`(`author_id`);
