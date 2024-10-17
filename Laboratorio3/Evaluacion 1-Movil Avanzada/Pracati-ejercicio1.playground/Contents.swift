import UIKit

class CalculosGeometricos {
    var pi: Double = 3.14159  // Propiedad de la clase
    
    // Método para calcular el área de un círculo
    func areaCirculo(radio: Double) -> Double {
        return pi * radio * radio
    }
    
    // Método para calcular el volumen de un cilindro
    func volumenCilindro(radio: Double, altura: Double) -> Double {
        let area = areaCirculo(radio: radio)  // Usa el método areaCirculo
        return area * altura
    }
}

// Crear una instancia de la clase
var calculos = CalculosGeometricos()

// Definir valores para el cálculo
var radio: Double = 5
var altura: Double = 10

// Calcular y mostrar el área del círculo
var area = calculos.areaCirculo(radio: radio)
print("El área del círculo con radio \(radio) es: \(area)")

// Calcular y mostrar el volumen del cilindro
var volumen = calculos.volumenCilindro(radio: radio, altura: altura)
print("El volumen del cilindro con radio \(radio) y altura \(altura) es: \(volumen)")
