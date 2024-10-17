//
//  ViewController2.swift
//  ToVisitTableView
//
//  Created by Mac13 on 24/09/24.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tablaDestinos: UITableView!
    
    var paisRecibido: String?
    var destinos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tablaDestinos.delegate = self
        tablaDestinos.dataSource = self

        // Establecer destinos según el país recibido
        if paisRecibido == "Perú" {
            destinos = ["Machu Picchu", "Lima", "Cusco"]
        } else if paisRecibido == "Brasil" {
            destinos = ["Río de Janeiro", "Sao Paulo", "Amazonas"]
        } else if paisRecibido == "México" {
            destinos = ["Cancún", "Ciudad de México", "Tulum"]
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "DestinoCelda", for: indexPath)
        celda.textLabel?.text = destinos[indexPath.row]
        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinoSeleccionado = destinos[indexPath.row]
        self.performSegue(withIdentifier: "pantallaTresSegue", sender: destinoSeleccionado)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaTresSegue" {
            let destinoVC = segue.destination as! ViewController3
            destinoVC.destinoRecibido = sender as? String
        }
    }
}

