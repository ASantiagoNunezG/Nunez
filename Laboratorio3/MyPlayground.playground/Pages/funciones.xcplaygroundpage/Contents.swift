import UIKit
//funciones sin retorno
func operaciones(){
    print("Lista de operaciones")
}

func RaizCuadrada(_ numero:Int){
    let resultado = sqrt(Double(numero))
    print("La raiz cuadrada de \(numero) es \(resultado)")
}

func Potencia(numero:Int, potencia:Int){
    let resultado = pow(Double(numero), Double(potencia))
    print("El numero \(numero) elevado a \(potencia) es \(resultado)")
}

func RaizCubica(numero:Int, raiz valor:Double) {
    let resultado = pow(Double(numero), (1/valor))
    print("El numero \(numero) elevado a la 1/\(valor) es \(resultado)")
}

/*
operaciones()
RaizCuadrada(16)
Potencia(numero: 2, potencia: 3)
RaizCubica(numero: 27, raiz: 3)*/


//funciones con retorno
func esPar(numero:Int)->Bool{
    if numero%2==0{
        return true
    }else{
        return false
    }
}

func dividePalabras(palabra:String)->[Character]{
    var letras = [Character]()
    for letra in palabra{
        letras.append(letra)
    }
    return letras
}

func estoyBien(peso: Double, altura: Double) -> (Double, String){
    let imc = peso / (altura * altura)
    var mensaje = ""

    if(imc > 10.50 && imc < 25.00){
        mensaje = "todo bien"
    }else{
        mensaje = "acudir al medico"
    }
    let resultado = (imc, mensaje)
    return resultado
}

/*
esPar(numero: 4)
dividePalabras(palabra: "NUNEZ")
estoyBien(peso: 65, altura: 1.75)
*/
