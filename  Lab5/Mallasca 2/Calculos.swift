import Foundation

class Calculos {
    private var number1: Double
    private var number2: Double
    
    // Constructor para inicializar los números
    init(number1: Double = 0, number2: Double = 0) {
        self.number1 = number1
        self.number2 = number2
    }
    
    // Método para configurar los números
    func setValues(_ number1: Double, _ number2: Double) {
        self.number1 = number1
        self.number2 = number2
    }
    
    // Método para multiplicar dos números
    func multiply() -> Double {
        return number1 * number2
    }
    
    // Método para dividir dos números
    func divide() -> Double? {
        guard number2 != 0 else {
            return nil // No se puede dividir por cero
        }
        return number1 / number2
    }
    
    // Método para encontrar el número mayor
    func maxNumber() -> Double {
        return max(number1, number2)
    }
}
