let reviews = ["5⭐: Great food!", "4⭐: Excellent service!", "1⭐: They didn't accept Dogecoin."]

let combinedReviews = reviews.reduce("Users say:") { $0 + " " + $1 }
print(combinedReviews)

let excitedReviews = reviews.filter { $0.contains("!") }
print(excitedReviews)

let lowercasedReviews = reviews.map { $0.lowercased() }
print(lowercasedReviews)

let sortedReviews = reviews.sorted { $0 < $1 }
print(sortedReviews)
