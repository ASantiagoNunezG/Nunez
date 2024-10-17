import Foundation

//OperacionesBasicas
class OperacionesBasicas {
    var num1: Double
    var num2: Double
    
    init(num1: Double, num2: Double) {
        self.num1 = num1
        self.num2 = num2
    }
    
    func suma() -> Double {
        return num1 + num2
    }
    
    func resta() -> Double {
        return num1 - num2
    }
    
    func multiplicacion() -> Double {
        return num1 * num2
    }
    
    func division() -> Double? {
        guard num2 != 0 else {
            print("Error: División por cero no permitida.")
            return nil
        }
        return num1 / num2
    }
}

// OperacionesAvanzadas :D
class OperacionesAvanzadas: OperacionesBasicas {
    var base: Double
    var exponente: Double
    var numeroRaiz: Double
    var raizValor: Double
    
    init(num1: Double, num2: Double, base: Double, exponente: Double, numeroRaiz: Double, raizValor: Double) {
        self.base = base
        self.exponente = exponente
        self.numeroRaiz = numeroRaiz
        self.raizValor = raizValor
        super.init(num1: num1, num2: num2)
    }
    
    func potencia() -> Double {
        return Foundation.pow(base, exponente)
    }
    
    func raiz() -> Double? {
        guard raizValor != 0 else {
            print("Error: La raíz no puede ser cero.")
            return nil
        }
        return Foundation.pow(numeroRaiz, 1/raizValor)
    }
    
    func factorial() -> Int {
        let entero = Int(num1)
        guard entero >= 0 else { return 0 }
        return (1...max(1, entero)).reduce(1, *)
    }
    
    func sumatoria() -> Int {
        let entero = Int(num1)
        return (1...entero).reduce(0, +)
    }
}

// probando...
let operaciones = OperacionesAvanzadas(num1: 5, num2: 3, base: 2, exponente: 3, numeroRaiz: 27, raizValor: 3)

print("Suma: \(operaciones.suma())")
print("Resta: \(operaciones.resta())")
print("Multiplicación: \(operaciones.multiplicacion())")
print("División: \(operaciones.division() ?? 0)")

print("Potencia: \(operaciones.potencia())")
print("Raíz: \(operaciones.raiz() ?? 0)")
print("Factorial: \(operaciones.factorial())")
print("Sumatoria: \(operaciones.sumatoria())")
