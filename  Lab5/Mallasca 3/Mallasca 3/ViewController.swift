import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var TxtInstruccion: UITextField!
    @IBOutlet var TxtCondicionSocial: UITextField!
    @IBOutlet var TxtNumeroDeHijos: UITextField!
    @IBOutlet var LblSueldoTotal: UILabel!
    

    
    // Sueldo básico
    let sueldoBase: Double = 1500.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func BtnCalcularSueldo(_ sender: Any) {
        // Obtener los valores de los UITextField
        guard let instruccion = TxtInstruccion.text, !instruccion.isEmpty,
              let condicionSocial = TxtCondicionSocial.text, !condicionSocial.isEmpty,
              let numeroDeHijosText = TxtNumeroDeHijos.text, let numeroDeHijos = Int(numeroDeHijosText) else {
            LblSueldoTotal.text = "Por favor ingresa todos los datos."
            return
        }
        
        // Calcular el porcentaje de instrucción
        let porcentajeInstruccion: Double
        switch instruccion.lowercased() {
        case "secundaria":
            porcentajeInstruccion = 0.05
        case "técnico":
            porcentajeInstruccion = 0.10
        case "universitario":
            porcentajeInstruccion = 0.20
        default:
            porcentajeInstruccion = 0.0
        }
        
        // Calcular el porcentaje de condición social
        var porcentajeCondicionSocial: Double
        switch condicionSocial.lowercased() {
        case "soltero":
            porcentajeCondicionSocial = 0.01
        case "casado":
            porcentajeCondicionSocial = 0.03
        default:
            porcentajeCondicionSocial = 0.0
        }
        
        // Calcular el incremento por hijos
        let incrementoPorHijo = 0.02
        let porcentajeHijos = incrementoPorHijo * Double(numeroDeHijos)
        
        // Calcular el sueldo total
        let incrementoInstruccion = sueldoBase * porcentajeInstruccion
        let incrementoCondicionSocial = sueldoBase * porcentajeCondicionSocial
        let incrementoTotalHijos = sueldoBase * porcentajeHijos
        var sueldoTotal = sueldoBase + incrementoInstruccion + incrementoCondicionSocial + incrementoTotalHijos
        
        // Aplicar descuento si el sueldo total excede los 1800
        if sueldoTotal > 1800 {
            sueldoTotal -= sueldoTotal * 0.10
        }
        
        // Mostrar el resultado en el UILabel
        LblSueldoTotal.text = String(format: "Sueldo Total: %.2f", sueldoTotal)
    }
}
