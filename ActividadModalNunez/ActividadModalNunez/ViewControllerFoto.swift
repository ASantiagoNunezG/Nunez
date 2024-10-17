//
//  ViewControllerFoto.swift
//  ActividadModalNunez
//
//  Created by Mac13 on 1/10/24.
//

import UIKit

class ViewControllerFoto: UIViewController {

    @IBOutlet var imgFotoGrande: UIImageView!
    var foto: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        imgFotoGrande.image = foto
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
