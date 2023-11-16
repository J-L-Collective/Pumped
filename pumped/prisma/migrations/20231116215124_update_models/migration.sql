/*
  Warnings:

  - You are about to drop the `Session` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Set` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Workout` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Set" DROP CONSTRAINT "Set_workoutId_fkey";

-- DropForeignKey
ALTER TABLE "Workout" DROP CONSTRAINT "Workout_sessionId_fkey";

-- DropTable
DROP TABLE "Session";

-- DropTable
DROP TABLE "Set";

-- DropTable
DROP TABLE "Workout";

-- CreateTable
CREATE TABLE "Sessions" (
    "sessionId" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Sessions_pkey" PRIMARY KEY ("sessionId")
);

-- CreateTable
CREATE TABLE "Workouts" (
    "workoutId" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "exerciseName" TEXT NOT NULL,

    CONSTRAINT "Workouts_pkey" PRIMARY KEY ("workoutId")
);

-- CreateTable
CREATE TABLE "Sets" (
    "setId" SERIAL NOT NULL,
    "workoutId" INTEGER NOT NULL,
    "reps" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,

    CONSTRAINT "Sets_pkey" PRIMARY KEY ("setId")
);

-- AddForeignKey
ALTER TABLE "Workouts" ADD CONSTRAINT "Workouts_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Sessions"("sessionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sets" ADD CONSTRAINT "Sets_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workouts"("workoutId") ON DELETE RESTRICT ON UPDATE CASCADE;
