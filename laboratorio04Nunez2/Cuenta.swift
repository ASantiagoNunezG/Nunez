import Foundation

class Cuenta {
    let numeroCuenta: String
    var saldo: Double
    let nombre: String
    
    init(numeroCuenta: String, saldo: Double, nombre: String) {
        self.numeroCuenta = numeroCuenta
        self.saldo = saldo
        self.nombre = nombre
    }
    
    func depositar(monto: Double) -> Double {
        if monto > 0 {
            saldo += monto
        }
        return saldo
    }
    
    func retirar(monto: Double) -> Double? {
        if monto > 0 && monto <= saldo {
            saldo -= monto
            return saldo
        } else if monto > saldo {
            // cuando no hay suficiente saldo
            print("Error: Saldo insuficiente para retirar el monto.")
            return nil
        } else {
            // uando el monto es negativo
            print("Error: El monto de retiro debe ser mayor que cero.")
            return nil
        }
    }
    
    func saldoActual() -> Double {
        return saldo
    }
}
