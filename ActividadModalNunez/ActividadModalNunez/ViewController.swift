//
//  ViewController.swift
//  ActividadModalNunez
//
//  Created by Mac13 on 1/10/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var Tfemail: UITextField!
    @IBOutlet var Tfalumno: UITextField!
    @IBOutlet var ImgFoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FOTO" {
            let visitafoto = segue.destination as! ViewControllerFoto
            visitafoto.foto = ImgFoto.image
        }
        
    }

}

