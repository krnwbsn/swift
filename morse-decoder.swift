var englishText = "this is a secret message"

var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

var letterToMorse: [String : String] = [
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--..",
    ".": ".-.-.-",
    "!": "-.-.--",
    "?": "..--..",
    ",": "--..--"
]

var morseText: String = ""

for element in englishText {
    if let morseChar = letterToMorse["\(element)"] {
        morseText += morseChar + " "
    } else {
        morseText += " "
    }
}

var decodedMessage: String = ""
var morseCodeArray = [String]()
var currMorse: String = ""

for char in secretMessage {
    if char != " " {
        currMorse += " "
    } else {
        switch currMorse {
        case "":
            currMorse += " "
            break
        case " ":
            morseCodeArray.append(" ")
            currMorse = ""
            break
        default:
            morseCodeArray.append(currMorse)
            currMorse = ""
        }
    }
}

morseCodeArray.append(currMorse)

var morseToLetter: [String : String] = [:]

for (letter, morseChar) in letterToMorse {
    morseToLetter[morseChar] = letter
}

for char in morseCodeArray {
    if let letterChar = morseToLetter[char] {
        decodedMessage += letterChar
    } else {
        decodedMessage += " "
    }
}

print(decodedMessage)

