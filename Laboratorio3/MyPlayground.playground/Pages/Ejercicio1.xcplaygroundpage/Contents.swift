func queHay(nombre: String) -> (Int, [Character]) {
    let vocales = "aeiouAEIOU"
    var vocalesHalladas = [Character]()
    
    for letra in nombre {
        if vocales.contains(letra) {
            vocalesHalladas.append(letra)
        }
    }
    
    return (vocalesHalladas.count, vocalesHalladas)
}

/*
let nombre = "Abraham"
let resultado = queHay(nombre: nombre)
print("Cantidad de vocales: \(resultado.0)")
print("Arreglo: \(resultado.1)")*/
