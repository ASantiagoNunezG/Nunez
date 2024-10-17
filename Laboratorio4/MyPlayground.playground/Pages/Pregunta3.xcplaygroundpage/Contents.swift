func calendarioPagos(cod: String, totalSemestre: Double, pagos: [Double], matricula: Bool) {
    print("Código del alumno: \(cod)")
    print("Alumno matriculado: \(matricula)")
    print("Monto total del semestre a pagar: \(totalSemestre)")
    print("\n----Calendario de pagos----")
    
    //verificar
    if(cod == "115954"){
        if(matricula == true){
            var deudaRestante = totalSemestre
            var i = 0
            while i < pagos.count {
                let pago = pagos[i]
                deudaRestante = deudaRestante - pago
                print("Mes \(i + 1): \(pago) ----- \(deudaRestante)")
                
                if deudaRestante <= 0 {
                    print("\n**Pago completado**")
                    break
                }
                i += 1
            }
        }else{
            print("\nPAGA TU MATRÍCULA")
        }
    }else{
        print("\nCODIGO NO VÁLIDO")
    }
    
}

// Datosatos
let codigoAlumno = "115954"
let estadoMatricula = true
let montoTotal = 1200.0
let montosPagos = [300.0, 100.0, 200.0, 200.0, 200.0, 200.0]

calendarioPagos(cod: codigoAlumno, totalSemestre: montoTotal, pagos: montosPagos, matricula: estadoMatricula)
