//
//  ContentView.swift
//  BoletaPago
//
//  Created by Mac13 on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sueldoBruto: Double = 0.0
    @State private var tieneEPS: Bool = false
    @State private var epsSeleccionado: String = "Essalud"
    @State private var aportePrevisional: String = "ONP"
    @State private var ingresosExtras: Double = 0.0
    @State private var numeroMiembros: Int = 1
    
    @State private var sueldoNeto: Double = 0.0
    @State private var impuestoRenta: Double = 0.0
    @State private var aportePrevisionalCalculado: Double = 0.0
    @State private var descuentoEPS: Double = 0.0
    
    private let UIT: Double = 5150
    private let tasaRenta: [String: Double] = [
        "0-5 UIT": 0.08,
        "5-20 UIT": 0.14,
        "20-35 UIT": 0.17,
        "35-45 UIT": 0.20,
        "45+ UIT": 0.30
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Título Principal
                Text("💼 Boleta de Pago 💰")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .padding(.top, 30)
                
                // Sueldo Bruto
                VStack(alignment: .leading, spacing: 8) {
                    Text("💵 Sueldo Bruto mensual")
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                    TextField("Ingrese el sueldo bruto", value: $sueldoBruto, formatter: NumberFormatter())
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // Número de Miembros
                VStack(alignment: .leading, spacing: 8) {
                    Text("👥 Número de miembros a afiliar al seguro")
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                    Picker("Número de Miembros", selection: $numeroMiembros) {
                        ForEach(1..<6, id: \.self) { i in
                            Text("\(i)").tag(i)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
                
                // EPS
                Toggle(isOn: $tieneEPS) {
                    Text("¿Tienes EPS? 🤔")
                        .foregroundColor(.blue)
                }
                .padding(.horizontal)
                
                if tieneEPS {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("🏥 Selecciona tu EPS")
                            .fontWeight(.bold)
                            .foregroundColor(.cyan)
                        Picker("Selecciona tu EPS", selection: $epsSeleccionado) {
                            Text("Essalud").tag("Essalud")
                            Text("Rímac").tag("Rímac")
                            Text("Pacífico").tag("Pacífico")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.horizontal)
                }
                
                // Aporte Previsional
                VStack(alignment: .leading, spacing: 8) {
                    Text("💼 Aporte Previsional")
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                    Picker("Aporte Previsional", selection: $aportePrevisional) {
                        Text("ONP").tag("ONP")
                        Text("AFP").tag("AFP")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
                
                // Ingresos Extras
                VStack(alignment: .leading, spacing: 8) {
                    Text("🤑 Ingresos Extras")
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                    TextField("Ingrese los ingresos extras", value: $ingresosExtras, formatter: NumberFormatter())
                        .padding()
                        .keyboardType(.decimalPad)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // Botón Calcular
                Button("📊 Calcular") {
                    calcularBoleta()
                }
                .padding()
                .background(Color.cyan)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                // Resultados
                VStack(alignment: .leading, spacing: 8) {
                    Text("📅 Sueldo Bruto: S/ \(String(format: "%.2f", sueldoBruto))")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("💼 Aporte previsional: S/ \(String(format: "%.2f", aportePrevisionalCalculado))")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("💸 Impuesto a la renta: S/ \(String(format: "%.2f", impuestoRenta))")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("🏥 Descuento EPS: S/ \(String(format: "%.2f", descuentoEPS))")
                        .font(.headline)
                        .foregroundColor(.black)
                    Text("💰 Sueldo Neto: S/ \(String(format: "%.2f", sueldoNeto))")
                        .font(.headline)
                        .foregroundColor(.green)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                
                // Más Detalles
                VStack(alignment: .leading, spacing: 8) {
                    Text("📊 Más Detalles")
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text("🔵 Sueldo Anual estimado: S/ \(String(format: "%.2f", sueldoBruto * 12))")
                        .font(.body)
                        .foregroundColor(.black)
                    Text("🔴 Sueldo Bruto - Sueldo Neto: S/ \(String(format: "%.2f", sueldoBruto - sueldoNeto))")
                        .font(.body)
                        .foregroundColor(.black)
                    Text("🟢 Total anual con ingresos extras: S/ \(String(format: "%.2f", (sueldoBruto + ingresosExtras) * 12))")
                        .font(.body)
                        .foregroundColor(.black)
                    Text("🟡 Descuento EPS por \(numeroMiembros) miembro(s): S/ \(String(format: "%.2f", descuentoEPS))")
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
            }
            .padding()
        }
        .background(Color.blue.opacity(0.1))
        .cornerRadius(15)
        .edgesIgnoringSafeArea(.all)
    }
    
    func calcularBoleta() {
        if aportePrevisional == "ONP" {
            aportePrevisionalCalculado = sueldoBruto * 0.13
        } else if aportePrevisional == "AFP" {
            aportePrevisionalCalculado = sueldoBruto * 0.10
        }
        
        let sueldoAnual = (sueldoBruto * 12) + (sueldoBruto * 2)  //falta lo de la gratificación de julio y diciembre
        let baseImponible = sueldoAnual - (UIT * 7)
        
        
        impuestoRenta = calcularImpuestoRenta(baseImponible)
        
        descuentoEPS = tieneEPS ? calcularDescuentoEPS() : 0.0//essalud por defalut
        
        sueldoNeto = sueldoBruto - (aportePrevisionalCalculado + impuestoRenta + descuentoEPS) + ingresosExtras
        
        
    }
    
    func calcularImpuestoRenta(_ baseImponible: Double) -> Double {
        // Define los límites de los tramos y las tasas asociadas
        let tramos = [
            (5 * UIT, 0.08),         // Primer tramo: hasta 5 UIT
            (15 * UIT, 0.14),        // Segundo tramo: de 5 a 20 UIT
            (15 * UIT, 0.17),        // Tercer tramo: de 20 a 35 UIT
            (10 * UIT, 0.20),        // Cuarto tramo: de 35 a 45 UIT
            (Double.infinity, 0.30)  // Quinto tramo: más de 45 UIT
        ]
        
        var restante = baseImponible
        var totalImpuesto: Double = 0.0

        // Itera sobre cada tramo
        for (limite, tasa) in tramos {
            if restante <= 0 { break } // Si ya no queda base imponible, detener el cálculo
            
            let montoGravable = min(restante, limite) // Aplica tasa solo al monto dentro del tramo
            totalImpuesto += montoGravable * tasa // Calcula el impuesto para el tramo actual
            restante -= montoGravable // Resta lo calculado de la base imponible restante
        }
        
        return totalImpuesto / 12 // Retorna el impuesto mensual
    }
    
    func calcularDescuentoEPS() -> Double {
        let porcentajeEPS: Double
        switch epsSeleccionado {
        case "Essalud":
            porcentajeEPS = 0.09 // 9% del sueldo bruto
        case "Rímac":
            porcentajeEPS = 0.04 + 0.0675// 4% del sueldo bruto
        case "Pacífico":
            porcentajeEPS = 0.035 + 0.0675// 3.5% del sueldo bruto
        default:
            porcentajeEPS = 0.00 // sin EPS
        }
        
        let costoEPS = sueldoBruto * porcentajeEPS // Costo total de la EPS seleccionada
        let cubiertoPorEssalud = sueldoBruto * 0.0675 // Aporte ESSALUD cubierto por el empleador
        let diferencia = max(costoEPS - cubiertoPorEssalud, 0.0) // Diferencia a cargo del trabajador
        return diferencia * Double(numeroMiembros) // Considerando el número de miembros
    }

    
    func calcularRimac() -> Double {
        return 0.0
    }
    
    func calcularPacifico()-> Double {
        return 0.0
    }
    
}

#Preview {
    ContentView()
}
