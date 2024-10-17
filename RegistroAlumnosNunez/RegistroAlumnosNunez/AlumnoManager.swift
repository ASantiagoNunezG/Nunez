//
//  AlumnoManager.swift
//  RegistroAlumnosNunez
//
//  Created by Mac13 on 1/10/24.
//

import Foundation

class AlumnoManager {
    static let shared = AlumnoManager()
    
    var listaAlumnos: [[String]] = []
    
    private init() {}
}
