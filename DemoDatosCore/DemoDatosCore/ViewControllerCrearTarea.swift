//
//  ViewControllerCrearTarea.swift
//  DemoDatosCore
//
//  Created by Mac13 on 15/10/24.
//

import UIKit

class ViewControllerCrearTarea: UIViewController {
    
    var anteriorVC = ViewController()
    @IBOutlet weak var txtNombreTarea: UITextField!
    
    @IBOutlet weak var swImportante: UISwitch!
    
    @IBAction func agregar(_ sender: Any) {
        //let tarea = Tarea()
        //se apertura uso de persistencia
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context)
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImportante.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //anteriorVC.tareas.append(tarea)
        //anteriorVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
