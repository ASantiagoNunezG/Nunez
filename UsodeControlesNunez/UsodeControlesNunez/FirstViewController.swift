//
//  FirstViewController.swift
//  UsodeControlesNunez
//
//  Created by Mac13 on 4/10/24.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txtRpta: UITextField!
    @IBOutlet weak var txtNumero2: UITextField!
    @IBOutlet weak var txtNumero1: UITextField!
    
    var nro1:Double = 0
    var nro2:Double = 0
    var rpta:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ocultarTeclado))
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }
    //Funcion sumar
    @IBAction func btnSumar(_ sender: Any) {
        if Double(txtNumero1.text!) != nil && Double(txtNumero2.text!) != nil{
            nro1 = Double(txtNumero1.text!)!
            nro2 = Double(txtNumero2.text!)!
            rpta = nro1 + nro2
            txtRpta.text = String(rpta)
        }else{
            mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numericos")
            print("Error al realizar operación")
        }
    
    }
    @IBAction func btnRestar(_ sender: Any) {
        if let numero1 = Double(txtNumero1.text!), let numero2 = Double(txtNumero2.text!) {
                rpta = numero1 - numero2
                txtRpta.text = String(rpta)
            } else {
                mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numéricos")
            }
    }
    
    @IBAction func btnDividir(_ sender: Any) {
        if let numero1 = Double(txtNumero1.text!), let numero2 = Double(txtNumero2.text!) {
                    if numero2 != 0 {
                        rpta = numero1 / numero2
                        txtRpta.text = String(rpta)
                    } else {
                        mostrarAlerta(titulo: "Error", mensaje: "No se puede dividir entre 0")
                    }
                } else {
                    mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numéricos")
                }
    }
    @IBAction func btnMultiplicar(_ sender: Any) {
        if let numero1 = Double(txtNumero1.text!), let numero2 = Double(txtNumero2.text!) {
                    rpta = numero1 * numero2
                    txtRpta.text = String(rpta)
                } else {
                    mostrarAlerta(titulo: "Error", mensaje: "Debe introducir solo valores numéricos")
                }
    }
    func Limpiar(){
        self.txtNumero1.text = "0"
        self.txtNumero2.text = "0"
        self.txtRpta.text = "0"
    }
    
    func mostrarAlerta(titulo: String, mensaje: String){
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let limpiar = UIAlertAction(title: "Limpiar", style: .default, handler: {(action) in self.Limpiar()})
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: {(action) in
        //Acciones a realizar
        })
        
        alerta.addAction(limpiar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
    }
    
    @objc func ocultarTeclado() {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
