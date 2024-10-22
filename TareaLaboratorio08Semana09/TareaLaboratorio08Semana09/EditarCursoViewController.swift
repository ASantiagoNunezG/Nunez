//
//  EditarCursoViewController.swift
//  TareaLaboratorio08Semana09
//
//  Created by nunez on 21/10/24.
//

import UIKit

class EditarCursoViewController: UIViewController {

    @IBOutlet weak var examenFiEditar: UITextField!
    @IBOutlet weak var promedioPraEditar: UITextField!
    @IBOutlet weak var promedioLabEditar: UITextField!
    @IBOutlet weak var nombreCursoEditar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func guardarCambios(_ sender: Any) {
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
