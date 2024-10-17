//
//  ViewController.swift
//  ToVisitTableView
//
//  Created by Mac13 on 24/09/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var Tabla: UITableView!
    
    var contenidoCeldas = ["Perú", "Brasil", "México"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tabla.delegate = self
        Tabla.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "Celda", for: indexPath)
        celda.textLabel?.text = contenidoCeldas[indexPath.row]
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let recursoSeleccionado = contenidoCeldas[indexPath.row]
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: recursoSeleccionado)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {
            let destinoVC = segue.destination as! ViewController2
            destinoVC.paisRecibido = sender as? String
        }
    }
}


