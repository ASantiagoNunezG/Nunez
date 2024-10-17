class Empleado {
    var ID: String
    var apellido: String
    var sueldoB: Double
    var HE: Double
    var DNI: String
    var afiliacion: String
    
    init(ID: String, apellido: String, sueldoB: Double, HE: Double, DNI: String, afiliacion: String) {
        self.ID = ID
        self.apellido = apellido
        self.sueldoB = sueldoB
        self.HE = HE
        self.DNI = DNI
        self.afiliacion = afiliacion
    }
    
    func montoExt() -> Double {
        let extra = (sueldoB * HE) / 240
        print("El monto extra será de: s/\(extra)")
        return extra
    }
    
    func montoSeg() -> Double {
        var mseguro: Double
        if afiliacion == "AFP" {
            mseguro = 0.17 * sueldoB
            print("El monto por el descuento del seguro AFP es s/\(mseguro)")
        } else if afiliacion == "SNP" {
            mseguro = 0.10 * sueldoB
            print("El monto por el descuento del seguro SNP es s/\(mseguro)")
        } else {
            mseguro = 0
            print("No hay descuento por seguro, AFP o SNP")
        }
        return mseguro
    }
    
    func montoEssalud() -> Double {
        let mEssalud = 0.02 * sueldoB
        print("El monto por el descuento de Essalud es s/\(mEssalud)")
        return mEssalud
    }
    
    func montoDescuento() -> Double {
        let descuentoSeg = montoSeg()
        let descuentoEssalud = montoEssalud()
        return descuentoSeg + descuentoEssalud
    }
    
    func sueldoBruto() -> Double {
        return sueldoB + montoExt()
    }
    
    func sueldoNeto() -> Double {
        return sueldoBruto() - montoDescuento()
    }
}

//-----------------------
let empleado = Empleado(ID: "0009", apellido: "Nuñez Garcia", sueldoB: 3000, HE: 10, DNI: "76328566", afiliacion: "SNP")
//print("Sueldo Bruto: s/\(empleado.sueldoBruto())")
//print("Sueldo Neto: s/\(empleado.sueldoNeto())")
