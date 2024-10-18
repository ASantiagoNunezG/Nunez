//
//  ViewController.swift
//  DemoDatosCore
//
//  Created by Mac13 on 15/10/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var indexSeleccionado: Int = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Número de celdas
        return tareas.count
    }
    
    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Contenido de celdas
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        
        if tarea.importante {
            cell.textLabel?.text = "🤨\(tarea.nombre!)"
        }else{
            cell.textLabel?.text = "😇\(tarea.nombre!)"
        }
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    //Definir el arreglo
    var tareas : [Tarea] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //definir las acciones para cargar los elementos en el table view
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //colocar el arreglo al cargar la vista
        //tareas = crearTareas()
    }
//Definir el arreglo de contenido de datos, retorna un arreglo que contiene tareas
    /*func crearTareas()->[Tarea]{
        let tarea1 = Tarea()
        tarea1.nombre = "Desarrollo de evaluacion"
        tarea1.importante = true
        let tarea2 = Tarea()
        tarea2.nombre = "Desarrollo de laboratorio"
        tarea2.importante = false
        let tarea3 = Tarea()
        tarea3.nombre = "Entrega de proyecto"
        tarea3.importante = true
        
        return [tarea1, tarea2, tarea3]
    }*/
    func obtenerTareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        }catch{
            print("Error al leer la entidad de CoreData")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if segue.identifier == "agregarSegue"{
            let siguienteVC = segue.destination as! ViewControllerCrearTarea
            siguienteVC.anteriorVC = self
        }*/if(segue.identifier == "tareaSeleccionadaSegue"){
            let siguienteVC = segue.destination as! ViewControllerTareaCompletada
            siguienteVC.tarea  = sender as! Tarea
            //siguienteVC.anteriorVC = self
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
}

