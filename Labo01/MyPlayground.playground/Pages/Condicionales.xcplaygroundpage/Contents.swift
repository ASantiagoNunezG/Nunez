//zonas y tarifas
let tarifas: [String: Double] = [
    "América del Norte": 24.0,
    "América Central": 20.0,
    "América del Sur": 21.0,
    "Europa": 10.0,
    "Asia": 18.0
]

//peso del paquete y la zona de destino
let peso: Double = 4.5
let zona: String = "Europa"

//proceso
if peso > 5.0 {
    print("Error: El peso supera los 5kg.")
} else {
    if let tarifa = tarifas[zona] {
        let costoEnvio = peso * tarifa
        print("El costo de envío es: \(costoEnvio) euros.")
    } else {
        print("Zona de destino no válida.")
    }
}
