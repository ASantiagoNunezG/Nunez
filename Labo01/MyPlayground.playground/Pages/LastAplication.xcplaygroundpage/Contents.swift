
// Función para verificar si un número es primo
func esPrimo(_ numero: Int) -> Bool {
    if numero <= 1 { return false }
    if numero <= 3 { return true }
    
    for i in 2...(Int(sqrt(Double(numero)))) {
        if numero % i == 0 {
            return false
        }
    }
    return true
}

// Solicitar el número de valores a ingresar
print("Ingrese la cantidad de números:")
guard let entrada = readLine(), let n = Int(entrada), n > 0 else {
    print("Número no válido.")
    exit(0)
}

var numeros: [Int] = []

// Solicitar los valores al usuario
for i in 1...n {
    print("Ingrese el número \(i):")
    if let entradaNumero = readLine(), let numero = Int(entradaNumero) {
        numeros.append(numero)
    } else {
        print("Número no válido.")
        exit(0)
    }
}

// Variables para almacenar resultados
var pares = 0
var impares = 0
var suma = 0
var primos = 0

for numero in numeros {
    suma += numero
    
    if numero % 2 == 0 {
        pares += 1
    } else {
        impares += 1
    }
    
    if esPrimo(numero) {
        primos += 1
    }
}

// Calcular el promedio
let promedio = Double(suma) / Double(n)

// Salida de resultados
print("Cantidad de números pares: \(pares)")
print("Cantidad de números impares: \(impares)")
print("Promedio de los números ingresados: \(promedio)")
print("Cantidad de números primos: \(primos)")
