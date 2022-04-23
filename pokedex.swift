class Pokemon {
    var num: Int = 0
    var name: String = ""
    var type: [String] = [""]
    var ability: [String] = [""]
    
    init(num: Int, name: String, type: [String], ability: [String]) {
        self.num = num
        self.name = name
        self.type = type
        self.ability = ability
    }
    
    func displayInfo() {
        print("No.        #\(num)")
        print("Name       \(name)")
        print("Type       \(type)")
        print("Abilities  \(ability)")
        print("===================================")
    }
}

var bulbasaur = Pokemon(num: 1, name: "Bulbasaur", type: ["Grass 🌱", "Poison 💀"], ability: ["Overgrow"])
var charmander = Pokemon(num: 4, name: "Charmander", type: ["Fire 🔥"], ability: ["Blaze"])
var squirtle = Pokemon(num: 7, name: "Squirtle", type: ["Water 💧"], ability: ["Torrent"])

bulbasaur.displayInfo()
charmander.displayInfo()
squirtle.displayInfo()

class GigantamaxPokemon: Pokemon {
    var location: String = ""
    
    init(num: Int, name: String, type: [String], ability: [String], location: String) {
        self.location = location
        super.init(num: num, name: name, type: type, ability: ability)
    }
    
    override func displayInfo() {
        print("No.        #\(num)")
        print("Name       \(name)")
        print("Type       \(type)")
        print("Abilities  \(ability)")
        print("Location   \(location)")
        print("===================================")
    }
}

var charizard = GigantamaxPokemon(num: 6, name: "Charizard", type: ["Fire 🔥"], ability: ["Blaze"], location: "Lake of Outrage")

charizard.displayInfo()

