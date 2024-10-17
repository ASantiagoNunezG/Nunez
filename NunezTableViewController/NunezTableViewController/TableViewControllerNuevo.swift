//
//  TableViewControllerNuevo.swift
//  NunezTableViewController
//
//  Created by Mac13 on 2/10/24.
//

import UIKit


class TableViewControllerNuevo: UITableViewController {
    
    var arregloNumeros: [String] = ["1","2","3","4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setEditing(true, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arregloNumeros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
       cell.textLabel?.text = arregloNumeros[indexPath.row]
       switch cell.textLabel?.text {
       case "1":
           cell.imageView?.image = UIImage(named: "ICONOS/1.png")
           cell.detailTextLabel?.text = "Celda numero 1"
       case "2":
           cell.imageView?.image = UIImage(named: "ICONOS/2.png")
           cell.detailTextLabel?.text = "Celda numero 2"
       case "3":
           cell.imageView?.image = UIImage(named: "ICONOS/3.png")
           cell.detailTextLabel?.text = "Celda numero 3"
       case "4":
           cell.imageView?.image = UIImage(named: "ICONOS/4.png")
           cell.detailTextLabel?.text = "Celda numero 4"
        default:
            print("No hay mas elementos para llenar la imagen")
            cell.detailTextLabel?.text = "Celda fuera de rango"
        }
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            arregloNumeros.remove(at: indexPath.row)
        } else if editingStyle == .insert {

        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objetoMovido = self.arregloNumeros[fromIndexPath.row]
        arregloNumeros.remove(at: fromIndexPath.row)
        arregloNumeros.insert(objetoMovido, at: to.row)
        NSLog("%@", "\(fromIndexPath.row) => \(to.row) \(arregloNumeros)")

    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if(self.isEditing){
            self.editButtonItem.title = "Editar"
        }
        else{
            self.editButtonItem.title = "Hecho"
        }
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Eliminar") { (action, view, handler) in
            self.arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
            handler(true)
        }
        
        let insertAction = UIContextualAction(style: .normal, title: "Insertar") { (action, view, handler) in
            let ultimoElemento = self.arregloNumeros.last ?? "0"
            self.arregloNumeros.append(String(Int(ultimoElemento)! + 1))
            tableView.reloadData()
            handler(true)
        }
        insertAction.backgroundColor = .green
        return UISwipeActionsConfiguration(actions: [deleteAction, insertAction])
    }

    

}
