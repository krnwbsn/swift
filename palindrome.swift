var text: [String] = ["h", "e", "l", "l", "o"]
var reservesed: [String] = [String]()

var counter = text.count - 1

while counter >= 0 {
    reservesed.append(text[counter])
    
    counter -= 1
}

var isPalindrome = text == reservesed

if isPalindrome {
    print("We have a palindrome! \(text) equal \(reservesed).")
} else {
    print("We don’t have a palindrome")
}

print(reservesed)
