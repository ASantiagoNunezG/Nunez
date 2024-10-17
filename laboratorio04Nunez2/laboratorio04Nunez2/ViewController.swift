import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblCuenta: UILabel!
    @IBOutlet var lblNombre: UILabel!
    @IBOutlet var lblSaldo: UILabel!
    @IBOutlet var txtMonto: UITextField!
    @IBOutlet var lblSaldoActual: UILabel!

    var cuenta: Cuenta?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configura los valores iniciales de la cuenta
        cuenta = Cuenta(numeroCuenta: "1234567890", saldo: 1000.0, nombre: "Nuñez Abraham")
        updateLabels()
    }

    @IBAction func btnDepositar(_ sender: Any) {
        guard let montoText = txtMonto.text, let monto = Double(montoText), monto > 0 else {
            showErrorAlert(message: "Ingrese un monto válido para depositar.")
            return
        }

        cuenta?.depositar(monto: monto)
        updateLabels()
    }
    
    @IBAction func btnRetirar(_ sender: Any) {
        guard let montoText = txtMonto.text, let monto = Double(montoText), monto > 0 else {
            showErrorAlert(message: "Ingrese un monto válido para retirar.")
            return
        }

        if let saldoActual = cuenta?.retirar(monto: monto) {
            lblSaldoActual.text = String(saldoActual)
        } else {
            showErrorAlert(message: "No se puede retirar el monto especificado.")
        }
    }
    
    func updateLabels() {
        guard let cuenta = cuenta else { return }
        
        lblCuenta.text = String(cuenta.numeroCuenta)
        lblNombre.text = String(cuenta.nombre)
        lblSaldo.text = String(cuenta.saldoActual())
        lblSaldoActual.text = String( cuenta.saldoActual())
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
