//
//  ViewController2.swift
//  TableView
//
//  Created by Mac13 on 20/09/24.
//

import UIKit

class ViewController2: UIViewController {

    
    @IBOutlet var vistaWeb: UIWebView!
    
    @IBOutlet var labelTitulo: UILabel!
    var recursoRecibido:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarRecurso()
        habilitarZoom()

    }
    func mostrarRecurso(){
        let direccionRecurso = URL(fileURLWithPath: Bundle.main.path(forResource: recursoRecibido!, ofType: "pdf", inDirectory: "RECURSOS")!)
        let datos = try? Data(contentsOf: direccionRecurso)
        vistaWeb.load(datos!, mimeType: "application/pdf", textEncodingName: "utf-8", baseURL: direccionRecurso)
    }
    func habilitarZoom(){
        vistaWeb.scalesPageToFit = true
    }
}
