struct Notas{
    private let porcentajeTeo = 0.3
    private let porcentajeLab = 0.7
    var promedioTeo = 0.0
    var promedioLab = 0.0
        
    func promedioFinal() -> Double {
        let promedio = self.promedioTeo*self.porcentajeTeo + self.promedioLab*self.porcentajeLab
        return promedio
    }
}

class Curso{
    var nombre:String = ""
    var notas = Notas()
}
/*
class Alumno{
    var nombre: String
    var cursos : [Curso]
    init(nombre:String, cursos: [Curso]) {
        self.nombre = nombre
        self.cursos = cursos
    }
    
    func listaCursosNotas() {
        for curso in self.cursos {
            print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
            let nombreCurso = curso.nombre
            let notaTeoria = curso.notas.promedioTeo
            let notaLaboratorio = curso.notas.promedioLab
            let notaFinal = curso.notas.promedioFinal()
            print("Curso: \(nombreCurso)")
            print("Teoria: \(notaTeoria)")
            print("Laboratorio: \(notaLaboratorio)")
            print("Promedio Final: \(notaFinal)")
        }
    }
}
// instancias
var cursos = [Curso]()

//curso 1
var curso1 = Curso()
var nota1 = Notas()
curso1.nombre = "Desarrollo de aplicaciones moviles"
nota1.promedioTeo = 12.5
nota1.promedioLab = 13
curso1.notas = nota1

//curso a lista
cursos.append(curso1)

//curso 2
var curso2 = Curso()
var nota2 = Notas()
curso2.nombre = "Desarrollo de aplicaciones moviles Avanzado"
nota2.promedioTeo = 16.4
nota2.promedioLab = 10
curso2.notas = nota2

//curso a lista
cursos.append(curso2)

//instancia alumno
var alumno = Alumno(nombre: "Juan Perez", cursos: cursos)

//lista de alumnos
var alumnos = [Alumno]()
alumnos.append(alumno)


// Alumno 3
var curso3 = Curso()
var nota3 = Notas()
curso3.nombre = "Programación en móviles Avanzado"
nota3.promedioTeo = 15.0
nota3.promedioLab = 17.0
curso3.notas = nota3

var curso4 = Curso()
var nota4 = Notas()
curso4.nombre = "Desarrollo de soluciones en la nube"
nota4.promedioTeo = 14.0
nota4.promedioLab = 16.0
curso4.notas = nota4

var cursos2 = [curso3, curso4]
var alumno2 = Alumno(nombre: "Abraham Nunez", cursos: cursos2)

alumnos.append(alumno2)

for alumno in alumnos {
    print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - -")
    print("Alumno: \(alumno.nombre)")
    alumno.listaCursosNotas()
    print()
}

//funcion
func listarPromedioGeneral(alumnos: [Alumno]) {
    for alumno in alumnos {
        let notasFinales = alumno.cursos.map { $0.notas.promedioFinal() }
        let promedioGeneral = notasFinales.reduce(0, +) / Double(notasFinales.count)
        print("Alumno: \(alumno.nombre) - Promedio General: \(promedioGeneral)")
    }
}

print("****************************")
listarPromedioGeneral(alumnos: alumnos)
*/
