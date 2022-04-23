print(".------------------------.")
print("| mixtape name    90 min |")
print("|     __  ______  __     |")
print("|    (  )|).....|(  )    |")
print("|    (__)|)_____|(__)    |")
print("|    ________________    |")
print("|___/_._o________o_._\\___|")

var mixtape: [String] = [String]()

mixtape.append("test1")
mixtape.append("test2")
mixtape.append("test3")
mixtape.append("test4")
mixtape.append("test5")
mixtape.append("test6")
mixtape.append("test7")
mixtape.append("test8")
mixtape.append("test9")
mixtape.append("test10")

mixtape.remove(at: 4)
mixtape.insert("Test11", at: 0)

var sideALength: Int = mixtape.count / 2

for i in 0..<sideALength {
    print(mixtape[i])
}

print(sideALength)
print(mixtape.count)

for i in sideALength..<mixtape.count {
    print(mixtape[i])
}
