//
//  ViewController.swift
//  Tarea06_M.A
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    struct Item {
        let name: String
        let image: UIImage
    }
    
    var items: [Item] = [Item(name: "Tiny", image: UIImage(named: "tiny")!)]
    
    @IBOutlet var tablas: UITableView!
    @IBOutlet var Agregar: UIButton!
    
    var newItemName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        tablas.dataSource = self
        tablas.delegate = self
        tablas.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        Agregar.addTarget(self, action: #selector(addItem), for: .touchUpInside)
    }
    
    @objc func addItem() {
        let alert = UIAlertController(title: "Agregar Alumno", message: "Ingresa el nombre del alumno", preferredStyle: .alert)
        alert.addTextField { $0.placeholder = "Nombre del Alumno" }
        alert.addAction(UIAlertAction(title: "Agregar", style: .default) { _ in
            guard let name = alert.textFields?[0].text, !name.isEmpty else { return }
            self.newItemName = name
            self.presentImagePicker()
        })
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        present(alert, animated: true)
    }
    
    func presentImagePicker() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage, let name = newItemName else { return }
        items.append(Item(name: name, image: image))
        tablas.reloadData()
        newItemName = nil
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        cell.imageView?.image = resizeImage(item.image, targetSize: CGSize(width: 100, height: 100))
        return cell
    }
    
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in image.draw(in: CGRect(origin: .zero, size: targetSize)) }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
