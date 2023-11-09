-- CreateTable
CREATE TABLE "Workout" (
    "workoutId" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "exerciseName" TEXT NOT NULL,

    CONSTRAINT "Workout_pkey" PRIMARY KEY ("workoutId")
);

-- CreateTable
CREATE TABLE "Set" (
    "setId" SERIAL NOT NULL,
    "workoutId" INTEGER NOT NULL,
    "reps" INTEGER NOT NULL,
    "weight" INTEGER NOT NULL,

    CONSTRAINT "Set_pkey" PRIMARY KEY ("setId")
);

-- AddForeignKey
ALTER TABLE "Workout" ADD CONSTRAINT "Workout_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "Session"("sessionId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Set" ADD CONSTRAINT "Set_workoutId_fkey" FOREIGN KEY ("workoutId") REFERENCES "Workout"("workoutId") ON DELETE RESTRICT ON UPDATE CASCADE;
