//
//  ViewControllerListar.swift
//  RegistroAlumnosNunez
//
//  Created by Mac13 on 1/10/24.
//

import UIKit

class ViewControllerListar: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tablaAlumnos: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()

            tablaAlumnos.delegate = self
            tablaAlumnos.dataSource = self
            
            tablaAlumnos.reloadData()
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return AlumnoManager.shared.listaAlumnos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let datos = AlumnoManager.shared.listaAlumnos[indexPath.row]
            
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "Código:  \(datos[0])\n Nombre: \(datos[1])\n Ciclo: \(datos[2])"
            return cell
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
