var names = ["Jason", "Kimberly", "Zach", "Austin", "Sarah", "Adam", "Kathy"]

let aNames = names.filter { $0.starts(with: ["A"]) }
print(aNames)

let sortedNames = names.sorted(by: <)
print(sortedNames)
