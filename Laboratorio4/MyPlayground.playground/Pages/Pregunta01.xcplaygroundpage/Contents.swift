var capacidad: Double = 50  // Capacidad del tanque en m3

func tiempoDemora(manguera: Double) -> Double {
    let volumenTanque = capacidad * 1000  // Convertir m3 a litros
    let tiempo = volumenTanque / manguera
    return tiempo/60
}
let manguera = 20.0
let tiempo = tiempoDemora(manguera: manguera)
//print("Tiempo para llenar el tanque: \(tiempo) horas")
