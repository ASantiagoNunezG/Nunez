//
//  ViewController.swift
//  TareaLaboratorio08Semana09
//
//  Created by Mac13 on 18/10/24.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Variable para almacenar mis cursos
    var cursos: [Curso] = []
    @IBOutlet weak var tablitaView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tablitaView.dataSource = self
        tablitaView.delegate =  self
        //Llamar a la funcion fetch/buscar para cargar los cursos desde core Data
        buscarCursos()
        //Recargar la tabla con los datos obtenidos
        tablitaView.reloadData()
    }
    
    //Numero de secciones
    func numberOfSections(in tablitaView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas para mis cursos en la tabla
    func tableView(_ tablitaView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return cursos.count
    }
    
    //Fetch de los cursos, osea busqueda :D
    func buscarCursos(){
        //Obtener el contexto de Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Crear una solicitud de fetch o busqueda para la entidad Curso
        let resultadosBusqueda: NSFetchRequest<Curso> = Curso.fetchRequest()
        
        do{
            //Ejecutar la solicitud y almacenar los resultados en el array de cursos
            cursos = try context.fetch(resultadosBusqueda)
            print("Número de cursos: \(cursos.count)")
        }catch{
            print("Error al realizar la busqueda: \(error)")
        }
    }
    
    //Configuracion de la celda
    func tableView(_ tablitaView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tablitaView.dequeueReusableCell(withIdentifier: "cursoCell", for: indexPath)
        let curso = cursos[indexPath.row]
        
        cell.textLabel?.text = curso.nombre
        var notaFinal:Double = (curso.promediolab + curso.promediopra + curso.examenfi)/3
        cell.detailTextLabel?.text = "Nota Final: \(notaFinal)"
        
        //Colorear la celde dependiendo si esta aprobado o reprobado
        if notaFinal >= 12.5{
            cell.backgroundColor = .green
        }else{
            cell.backgroundColor = .red
        }
        
        
        
        return cell
    }

}

