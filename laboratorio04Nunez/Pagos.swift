import Foundation

class Pagos {
    var precio: Double
    var cantidad: Int
    
    // Constructor
    init(precio: Double, cantidad: Int) {
        self.precio = precio
        self.cantidad = cantidad
    }
    
    func montoInicial() -> Double {
        return precio * Double(cantidad)
    }

    func descuento() -> Double {
        let monto = montoInicial()
        return monto * 0.1
    }

    func igv() -> Double {
        let monto = montoInicial()
        return monto * 0.18
    }

    func total() -> Double {
        let monto = montoInicial()
        let desc = descuento()
        let impuesto = igv()
        return (monto + impuesto) - desc
    }
}

