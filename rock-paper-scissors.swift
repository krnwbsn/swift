func getUserChoice(userInput: String) -> String {
    if userInput == "rock" || userInput == "paper" || userInput == "scissors" {
        return userInput
    } else {
        return "You can only enter rock, paper, or scissors. Try again."
    }
}

func getComputerChoice() -> String {
    let randomNumber = Int.random(in: 1...3)
    
    switch randomNumber {
    case 1:
        return "rock"
    case 2:
        return "paper"
    case 3:
        return "scissors"
    default:
        return "Something went wrong"
    }
}

func determineWinner(_ userChoice: String, _ compChoice: String) -> String {
    var decision: String = "It's a tie"
    
    switch userChoice {
    case "rock":
        if compChoice == "paper" {
            decision = "The computer won"
        } else if compChoice == "scissors" {
            decision = "The user won"
        }
    case "paper":
        if compChoice == "scissors" {
            decision = "The computer won"
        } else if compChoice == "rock" {
            decision = "The user won"
        }
    case "scissors":
        if compChoice == "rock" {
            decision = "The computer won"
        } else if compChoice == "paper" {
            decision = "The user won"
        }
    default:
        decision = "Something went wrong"
    }
    
    return decision
}

let userChoice = getUserChoice(userInput: "paper")
let compChoice = getComputerChoice()

print("You threw \(userChoice)")
print("Computer threw \(compChoice)")
print(determineWinner(userChoice, compChoice))



