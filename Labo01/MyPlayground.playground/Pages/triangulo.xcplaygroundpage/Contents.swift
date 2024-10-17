for i in 0..<5 {
    for j in 0..<5 {
        if i == j || i + j == 4 {
            print("*", terminator: "")
        } else {
            print(" ", terminator: "")
        }
    }
    print()
}
