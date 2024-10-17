import UIKit
 

// Clase para manejar el cálculo de pagos
class SistemaPagos {
    // Propiedades para almacenar el monto del producto y el número de cuotas
    var montoProducto = 0.0
    var numeroCuotas = 0
    
    // Método para calcular y mostrar el plan de pagos
    func calcularPagos() {
        // Verificar que el número de cuotas sea válido (6, 12 o 24)
        guard [6, 12, 24].contains(numeroCuotas) else {
            print("Error: El número de cuotas debe ser 6, 12 o 24.")
            return
        }
        
        // Calcular el monto mensual a pagar
        let montoMensual = montoProducto / Double(numeroCuotas)
        var montoRestante = montoProducto
        
        print("Plan de pagos para $\(montoProducto.redondear(2)) en \(numeroCuotas) cuotas:")
        // Iterar por cada cuota y mostrar los detalles
        for cuota in 1...numeroCuotas {
            montoRestante -= montoMensual
            print("Cuota \(cuota): Pago mensual: $\(montoMensual.redondear(2)), Monto restante: $\(montoRestante.redondear(2))")
        }
    }
}

// Extensión para redondear números Double a dos decimales
extension Double {
    func redondear(_ decimales: Int) -> Double {
        let multiplicador = pow(10.0, Double(decimales))
        return (self * multiplicador).rounded() / multiplicador
    }
}

// Ejemplo de uso del sistema de pagos
let venta = SistemaPagos()
venta.montoProducto = 1000.0 // Establecer el monto del producto
venta.numeroCuotas = 6        // Establecer el número de cuotas
venta.calcularPagos()         // Calcular y mostrar el plan de pagos
