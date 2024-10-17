//
//  ViewController3.swift
//  ToVisitTableView
//
//  Created by Mac13 on 24/09/24.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    var destinoRecibido: String?
    
    let imagenesDestinos: [String: String] = [
            "Machu Picchu": "machu_picchu.jpeg",
            "Lima": "cdmx.jpg",
            "Cusco": "cdmx.jpg",
            "Río de Janeiro": "cdmx.jpg",
            "Sao Paulo": "sao_paulo.jpg",
            "Amazonas": "cdmx.jpg",
            "Cancún": "cdmx.jpg",
            "Ciudad de México": "cdmx.jpg",
            "Tulum": "cdmx.jpg"
        ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let destino = destinoRecibido, let nombreImagen = imagenesDestinos[destino] {
            let rutaImagen = "CONTRIES/\(nombreImagen)"
            imgView.image = UIImage(named: rutaImagen)
        }
        
    }
}

