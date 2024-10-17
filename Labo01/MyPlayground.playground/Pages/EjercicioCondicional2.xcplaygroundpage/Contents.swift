import UIKit
let notaFinal = 11

switch notaFinal {
case 0...10:
    print("Desaprobado")
case 11, 12:
    print("Subsanación")
case 13...20:
    print("Aprobado")
default:
    print("La nota no está dentro del rango permitido")
}
