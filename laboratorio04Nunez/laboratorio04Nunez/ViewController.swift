import UIKit

class ViewController: UIViewController {

    // Configuración de los controles
    @IBOutlet var txtPrecio: UITextField!
    @IBOutlet var txtCantidad: UITextField!
    
    @IBOutlet var lblInicial: UILabel!
    @IBOutlet var lblDescuento: UILabel!
    @IBOutlet var lblIgv: UILabel!
    @IBOutlet var lblTotal: UILabel!
    
    @IBOutlet var btnCalculate: UIButton!
    
    var pagos: Pagos?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnCalculate(_ sender: UIButton) {
        // Obtener y validar los datos de los UITextField
        guard let precioText = txtPrecio.text, !precioText.isEmpty,
              let cantidadText = txtCantidad.text, !cantidadText.isEmpty,
              let precio = Double(precioText),
              let cantidad = Int(cantidadText) else {
            showErrorAlert()
            return
        }
        
        // Crear una instancia de Pagos y realizar los cálculos
        pagos = Pagos(precio: precio, cantidad: cantidad)
        updateLabels()
    }
    
    func updateLabels() {
        guard let pagos = pagos else { return }
        
        // Obtener los valores calculados
        let montoInicial = pagos.montoInicial()
        let descuento = pagos.descuento()
        let igv = pagos.igv()
        let total = pagos.total()
        
        // Actualizar las etiquetas con los resultados
        lblInicial.text = String(montoInicial)
        lblDescuento.text = String(descuento)
        lblIgv.text = String(igv)
        lblTotal.text = String(total)
    }
    
    func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Por favor, introduzca valores válidos para precio y cantidad.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

    
    
    




