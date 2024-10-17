//
//  ViewControllerRegistrar.swift
//  RegistroAlumnosNunez
//
//  Created by Mac13 on 1/10/24.
//

import UIKit

class ViewControllerRegistrar: UIViewController {

    @IBOutlet var Tfnombre: UITextField!
    @IBOutlet var Tfcodigo: UITextField!
    @IBOutlet var Tfciclo: UITextField!
    
    var listaAlumnos: [[String]] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func BtnRegistrar(_ sender: UIButton) {
        let codigo = Tfcodigo.text ?? "-"
                let nombre = Tfnombre.text ?? "-"
                let ciclo = Tfciclo.text ?? "-"
                

                AlumnoManager.shared.listaAlumnos.append([codigo, nombre, ciclo])
                
                dismiss(animated: true, completion: nil)
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
