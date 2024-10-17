import UIKit

import Foundation

// Clase para gestionar el censo
class Censo {
    // Array para almacenar la edad y peso de cada ciudadano
    var ciudadanos: [(edad: Int, peso: Double)] = []
    
    // Función para agregar un ciudadano al censo
    func agregarCiudadano(edad: Int, peso: Double) {
        ciudadanos.append((edad: edad, peso: peso))
        print("Ciudadano agregado: Edad \(edad), Peso \(peso) kg")
    }
    
    // Función para calcular y mostrar los promedios de peso por rango de edad
    func calcularPromedios() {
        // Diccionarios para almacenar la suma de pesos y el conteo por rango de edad
        var sumaPesos = [String: Double]()
        var conteo = [String: Int]()
        
        // Rangos de edad definidos
        let rangos = ["0 - 5", "6 - 15", "16 - 25", "26 - 50", "50+"]
        
        // Clasificar cada ciudadano en su rango de edad y sumar sus pesos
        for ciudadano in ciudadanos {
            let rango = obtenerRango(edad: ciudadano.edad)
            sumaPesos[rango, default: 0] += ciudadano.peso
            conteo[rango, default: 0] += 1
        }
        
        // Mostrar los promedios calculados
        print("\nPromedios de peso por rango de edad:")
        for rango in rangos {
            if let suma = sumaPesos[rango], let count = conteo[rango], count > 0 {
                let promedio = suma / Double(count)
                print("\(rango): \(String(format: "%.2f", promedio)) kg")
            } else {
                print("\(rango): Sin datos")
            }
        }
    }
    
    // Función auxiliar para determinar el rango de edad
    private func obtenerRango(edad: Int) -> String {
        switch edad {
        case 0...5: return "0 - 5"
        case 6...15: return "6 - 15"
        case 16...25: return "16 - 25"
        case 26...50: return "26 - 50"
        default: return "50+"
        }
    }
}

// Ejemplo de uso
let censo = Censo()

// Agregar ciudadanos
censo.agregarCiudadano(edad: 3, peso: 15.5)
censo.agregarCiudadano(edad: 10, peso: 35.0)
censo.agregarCiudadano(edad: 20, peso: 65.5)
censo.agregarCiudadano(edad: 35, peso: 70.0)
censo.agregarCiudadano(edad: 60, peso: 75.5)

// Calcular y mostrar promedios
censo.calcularPromedios()
