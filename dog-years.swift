var dogAge: Int = 2
var earlyYears: Int = 21
// The first two years of a dog’s life count as 21 human years.
var LaterYears: Int = (dogAge - 2) * 4
// Each following year counts as 4 human years.
var humanYears: Int = earlyYears + LaterYears
print("My name is Anj! Ruff ruff, I am \(humanYears) years old in human years.")

