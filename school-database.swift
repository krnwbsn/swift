struct Student {
    var name: String
    var favoriteTeacherID: Int
}

struct Teacher {
    var id: Int
    var name: String
    var hairColor: String?
    var email: String?
}

struct School {
    var name: String
    var teachers: [Teacher]
    
    func getTeacher(withID id: Int) -> Teacher? {
        for teacher in teachers {
            if teacher.id == id {
                return teacher
            }
        }
        return nil
    }
    
    func printFavoriteTeacherInfo(for student: Student) {
        guard let favoriteTeacher = getTeacher(withID: student.favoriteTeacherID) else {
            print("No teacher with the id \(student.favoriteTeacherID) works at \(name)!")
            return
        }
        print("\(student.name)'s favorite teacher is \(favoriteTeacher.name)")
                print("They have \(favoriteTeacher.hairColor ?? "no") hair")
        if let teacherEmail = favoriteTeacher.email {
            print("Their email address is \(teacherEmail)")
        } else {
            print("They don't have an email address on file")
        }
    }
}

let teachers = [
    Teacher(id: 592, name: "Mr. Weatherbee", hairColor: nil, email: "thebee@riverdale.com"),
    Teacher(id: 481, name: "Ms. Grundy", hairColor: "white", email: nil),
    Teacher(id: 688, name: "Mr. Adams", hairColor: "black", email: "arthurAdams@riverdale.com")
]
let smansa = School(name: "Smansa", teachers: teachers)

let krina = Student(name: "Krina", favoriteTeacherID: 481)
let riyan = Student(name: "Riyan", favoriteTeacherID: 443)

smansa.printFavoriteTeacherInfo(for: krina)
smansa.printFavoriteTeacherInfo(for: riyan)

