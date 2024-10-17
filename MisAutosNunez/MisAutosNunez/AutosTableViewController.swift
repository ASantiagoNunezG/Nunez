//
//  AutosTableViewController.swift
//  MisAutosNunez
//
//  Created by Mac13 on 4/10/24.
//

import UIKit

class AutosTableViewController: UITableViewController {
    
    var arregloAutos: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arregloAutos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaAuto", for: indexPath)
        let auto = arregloAutos[indexPath.row]
        cell.textLabel?.text = "Auto \(auto)"
        
        // Cambiar imagen y detalle según el caso
        switch auto {
        case "1":
            cell.imageView?.image = UIImage(named: "AUTOS/1.png")
            cell.detailTextLabel?.text = "Toyota del 2010"
        case "2":
            cell.imageView?.image = UIImage(named: "AUTOS/2.png")
            cell.detailTextLabel?.text = "Fly car de USA 2"
        case "3":
            cell.imageView?.image = UIImage(named: "AUTOS/3.png")
            cell.detailTextLabel?.text = "Fly car de CHINA 3"
        case "4":
            cell.imageView?.image = UIImage(named: "AUTOS/4.png")
            cell.detailTextLabel?.text = "Auto modelo prehistorico"
        case "5":
            cell.imageView?.image = UIImage(named: "AUTOS/5.png")
            cell.detailTextLabel?.text = "Volkswagen 2020"
        case "6":
            cell.imageView?.image = UIImage(named: "AUTOS/6.png")
            cell.detailTextLabel?.text = "Volkswagen Hippie"
        case "7":
            cell.imageView?.image = UIImage(named: "AUTOS/7.png")
            cell.detailTextLabel?.text = "Toyota Corolla"
        case "8":
            cell.imageView?.image = UIImage(named: "AUTOS/8.png")
            cell.detailTextLabel?.text = "Lamborguini negro"
        case "9":
            cell.imageView?.image = UIImage(named: "AUTOS/9.png")
            cell.detailTextLabel?.text = "Lamborguini rojo Pro"
        case "10":
            cell.imageView?.image = UIImage(named: "AUTOS/10.png")
            cell.detailTextLabel?.text = "Ford azul clásico"
        default:
            cell.imageView?.image = nil
            cell.detailTextLabel?.text = "No hay descripción disponible."
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arregloAutos.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objetoMovido = arregloAutos[fromIndexPath.row]
        arregloAutos.remove(at: fromIndexPath.row)
        arregloAutos.insert(objetoMovido, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { (action, view, handler) in
            self.arregloAutos.remove(at: indexPath.row)
            tableView.reloadData()
            handler(true)
        }
        
        let viewMoreAction = UIContextualAction(style: .normal, title: "Ver Más") { (action, view, handler) in
            let selectedAuto = self.arregloAutos[indexPath.row]
            let alert = UIAlertController(title: "Auto \(selectedAuto)", message: self.descripcionAuto(auto: selectedAuto), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            handler(true)
        }
        
        viewMoreAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [deleteAction, viewMoreAction])
    }
    
    // Función para obtener la descripción del auto
    func descripcionAuto(auto: String) -> String {
        switch auto {
        case "1": return "Descripción detallada del Auto 1."
        case "2": return "Descripción detallada del Auto 2."
        case "3": return "Descripción detallada del Auto 3."
        case "4": return "Descripción detallada del Auto 4."
        case "5": return "Descripción detallada del Auto 5."
        case "6": return "Descripción detallada del Auto 6."
        case "7": return "Descripción detallada del Auto 7."
        case "8": return "Descripción detallada del Auto 8."
        case "9": return "Descripción detallada del Auto 9."
        case "10": return "Descripción detallada del Auto 10."
        default: return "No hay descripción disponible."
        }
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            self.navigationItem.rightBarButtonItem?.title = "Hecho" // Cambia el título a "Hecho"
        } else {
            self.navigationItem.rightBarButtonItem?.title = "Editar" // Cambia el título a "Editar"
        }
    }

}

