//
//  CrearCursoViewController.swift
//  TareaLaboratorio08Semana09
//
//  Created by nunez on 21/10/24.
//

import UIKit
import CoreData

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var examenFi: UITextField!
    @IBOutlet weak var promedioPra: UITextField!
    @IBOutlet weak var promedioLab: UITextField!
    @IBOutlet weak var nombreCurso: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func guardarCurso(_ sender: UIButton) {
        //Validar que los campos no esten vacios
        guard let nombretxt = nombreCurso.text, !nombretxt.isEmpty,
              let promedioPracticastxt = promedioPra.text, !promedioPracticastxt.isEmpty,
              let promedioLaboratoriostxt = promedioLab.text, !promedioLaboratoriostxt.isEmpty,
              let examenFinaltxt = examenFi.text, !examenFinaltxt.isEmpty,
              let promedioPracticas = Double(promedioPracticastxt),
              let promedioLaboratorios = Double(promedioLaboratoriostxt),
              let examenFinal = Double(examenFinaltxt)
        else{
            //Mostrar un mensaje de error si los campos estan vacios o las notas no son validas
            showAlert("Por favor, completa todos los campos con valores validos.")
            return
        }
        
        //Obtener el contexto de Core Data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //Crear una nueva instancia de curso
        let nuevoCurso = Curso(context: context)
        nuevoCurso.nombre = nombretxt
        nuevoCurso.promediopra = promedioPracticas
        nuevoCurso.promediolab = promedioLaboratorios
        nuevoCurso.examenfi = examenFinal
        
        //Guardar el contexto
        do{
            try context.save()
            print("Curso guardado exitosamente")
            //Limpiar los campos de texto despues de guardar
            limpiarCampos()
        }catch{
            print("Error al guardar curso: \(error)")
        }
    }
    //Funcion para mostrar la alerta previamente definida
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    //Funcion para limpiar los campos de texto
    func limpiarCampos(){
        nombreCurso.text = ""
        promedioLab.text = ""
        promedioPra.text = ""
        examenFi.text = ""
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
