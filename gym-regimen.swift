struct Exercise {
    var name: String
    var muscleGroups: [String]
    var reps: Int
    var sets: Int
    var totalReps: Int
    
    init(name: String, muscleGroups: [String], reps: Int, sets: Int) {
        self.name = name
        self.muscleGroups = muscleGroups
        self.reps = reps
        self.sets = sets
        self.totalReps = reps * sets
    }
}

var pushUp: Exercise = Exercise(name: "Push up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 10, sets: 3)
var sitUp: Exercise = Exercise(name: "Sit up", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 8, sets: 2)
var squat: Exercise = Exercise(name: "Squat", muscleGroups: ["Triceps", "Chest", "Shoulders"], reps: 5, sets: 5)

struct Regimen {
    var dayOfWeek: String
    var exercises: [Exercise]
    
    init(dayOfWeek: String, exercises: [Exercise]) {
        self.dayOfWeek = dayOfWeek
        self.exercises = exercises
    }
    
    func printExercisePlan() -> Void {
        print("Today is \(self.dayOfWeek) and the plan is to: ")
        
        for exercise in self.exercises {
            print("Do \(exercise.sets) sets of \(exercise.reps) \(exercise.name)s")
            print("That's a total of \(exercise.totalReps) \(exercise.name).")
        }
    }
}

var mondayRegimen: Regimen = Regimen(dayOfWeek: "Monday", exercises: [pushUp])
var tuesdayRegimen: Regimen = Regimen(dayOfWeek: "Tuesday", exercises: [sitUp])
var wednesdayRegimen: Regimen = Regimen(dayOfWeek: "Wednesday", exercises: [squat])
print(mondayRegimen.printExercisePlan())
print(tuesdayRegimen.printExercisePlan())
print(wednesdayRegimen.printExercisePlan())


