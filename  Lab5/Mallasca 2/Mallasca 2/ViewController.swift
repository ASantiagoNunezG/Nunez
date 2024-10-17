import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var TxtValor1: UITextField!
    @IBOutlet var TxtValor2: UITextField!
    @IBOutlet var LblResultado: UILabel!
    
    // Instanciar con datos opcionales(?)
    var calcula: Calculos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Inicializar el Calculos con valores por defecto si es necesario
        calcula = Calculos() // Corrección aquí
    }

    // Enumeración para los tipos de operación
    enum TipoOperacion {
        case multiplication
        case division
        case max
    }

    // Método para realizar la operación seleccionada
    private func performOperation(operacion: TipoOperacion) {
        guard let text1 = TxtValor1.text, let text2 = TxtValor2.text,
              let number1 = Double(text1), let number2 = Double(text2) else {
            LblResultado.text = "Por favor ingresa números válidos."
            return
        }
        
        // Configurar el calculator con los números ingresados
        calcula?.setValues(number1, number2) // Corrección aquí
        
        var result: String
        
        switch operacion {
        case .multiplication:
            result = "Multiplicación: \(calcula?.multiply() ?? 0)"
        case .division:
            if let divisionResult = calcula?.divide() {
                result = "División: \(divisionResult)"
            } else {
                result = "No se puede dividir por cero."
            }
        case .max:
            result = "Número mayor: \(calcula?.maxNumber() ?? 0)"
        }
        
        LblResultado.text = result
    }

    @IBAction func BtnMultiplica(_ sender: Any) {
        performOperation(operacion: .multiplication)
    }
    
    @IBAction func BtnDividir(_ sender: Any) {
        performOperation(operacion: .division)
    }
    
    @IBAction func BtnMax(_ sender: Any) {
        performOperation(operacion: .max)
    }
}
