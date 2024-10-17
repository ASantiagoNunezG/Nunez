var numeros: [Int] = [2, 9, 6, 8, 1, 3, 5, 7]

for i in 0..<numeros.count {
    for j in 0..<numeros.count - i - 1 {
        if numeros[j] > numeros[j + 1] {
            let temp = numeros[j]
            numeros[j] = numeros[j + 1]
            numeros[j + 1] = temp
        }
    }
}
print("Ordenado: \(numeros)")
