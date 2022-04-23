var spanish101: Set = ["Angela", "Declan", "Aldany", "Alex", "Sonny", "Alif", "Skyla"]
var german101: Set = ["Angela", "Alex", "Declan", "Kenny", "Cynara", "Adam"]
var advancedCalculus: Set = ["Cynara", "Gabby", "Angela", "Samantha", "Ana", "Aldany", "Galina", "Jasmine"]
var artHistory: Set = ["Samantha", "Vanessa", "Aldrian", "Cynara", "Kenny", "Declan", "Skyla"]
var englishLiterature: Set = ["Gabby", "Jasmine", "Alex", "Alif", "Aldrian", "Adam", "Angela"]
var computerScience: Set = ["Galina", "Kenny", "Sonny", "Alex", "Skyla"]

// Write your code below 🍎
var allStudents = spanish101.union(german101).union(advancedCalculus).union(artHistory).union(englishLiterature).union(computerScience)

for student in allStudents {
    print(student)
}

print(allStudents.count)

var noLanguage: Set = allStudents.subtracting(spanish101).subtracting(german101)
print(noLanguage)

var spanishOrGerman: Set = spanish101.symmetricDifference(german101)
print(spanishOrGerman)

var languageAwardWinners: Set = spanish101.intersection(german101).intersection(englishLiterature)
print(languageAwardWinners)

var sevenPlus: Int = 0
var classSet: Set = [spanish101,
                     german101,
                     advancedCalculus,
                     artHistory,
                     englishLiterature,
                     computerScience]

for aClass in classSet {
    if aClass.count >= 7 {
        sevenPlus += 1
    }
}

print(sevenPlus)


