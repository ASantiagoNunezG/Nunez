//
//  ContentView.swift
//  BoletaDePagos
//
//  Created by nunez on 26/11/24.
//

//
//  ContentView.swift
//  CompraVehiculos
//
//  Created by Mac13 on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sueldoBruto: Double = 0.0
    @State private var tieneEPS: Bool = false
    @State private var epsSeleccionado: String = "Essalud"
    @State private var aportePrevisional: String = "ONP"
    @State private var ingresosExtras: Double = 0.0
    
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
        VStack {
            // Título Principal
            Text("💼 Boleta de Pago 💰")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top, 60)
            
            Spacer()
            
            // Ingreso Sueldo Bruto
            TextField("💵 Sueldo Bruto Mensual", value: $sueldoBruto, formatter: NumberFormatter())
                .padding()
                .keyboardType(.decimalPad)
                .background(Color.white.opacity(0.7))
                .cornerRadius(8)
                .padding(.horizontal)
            
            // Toggle EPS
            Toggle(isOn: $tieneEPS) {
                Text("¿Tienes EPS? 🤔")
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Picker para EPS
            if tieneEPS {
                Picker("Selecciona tu EPS", selection: $epsSeleccionado) {
                    Text("Essalud").tag("Essalud")
                    Text("Rímac").tag("Rímac")
                    Text("Pacífico").tag("Pacífico")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.top, 10)
            }
            
            // Selector de Aporte Previsional
            Picker("Aporte Previsional 🏦", selection: $aportePrevisional) {
                Text("ONP").tag("ONP")
                Text("AFP").tag("AFP")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.top, 10)
            
            // Ingreso de Horas Extras
            TextField("⏰ Ingresos Extras", value: $ingresosExtras, formatter: NumberFormatter())
                .padding()
                .keyboardType(.decimalPad)
                .background(Color.white.opacity(0.7))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top, 10)
            
            Button("📊 Calcular Boleta") {
                calcularBoleta()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 15)
            
            // Resultados
            VStack(alignment: .leading, spacing: 8) {
                Text("📅 Sueldo Bruto: S/ \(String(format: "%.2f", sueldoBruto))")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("💼 Aporte Previsional: S/ \(String(format: "%.2f", aportePrevisionalCalculado))")
                    .font(.headline)
                    .foregroundColor(.black)
                Text("💸 Impuesto a la Renta: S/ \(String(format: "%.2f", impuestoRenta))")
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
            .padding(.top, 20)
            
            Spacer()
        }
        .background(Color.blue.opacity(0.1))
        .cornerRadius(15)
        .edgesIgnoringSafeArea(.all)
    }
    
    func calcularBoleta() {
        // Aporte Previsional
        if aportePrevisional == "ONP" {
            aportePrevisionalCalculado = sueldoBruto * 0.13
        } else if aportePrevisional == "AFP" {
            aportePrevisionalCalculado = sueldoBruto * 0.10
        }
        
        // Sueldo Anual Proyectado y Base Imponible
        let sueldoAnual = sueldoBruto * 12
        let baseImponible = sueldoAnual - (UIT * 7)
        
        // Cálculo del Impuesto a la Renta
        impuestoRenta = calcularImpuestoRenta(baseImponible)
        
        // Cálculo de EPS
        if tieneEPS {
            descuentoEPS = calcularDescuentoEPS()
        } else {
            descuentoEPS = 0.0
        }
        
        // Cálculo del Sueldo Neto
        sueldoNeto = sueldoBruto - (aportePrevisionalCalculado + impuestoRenta + descuentoEPS) + ingresosExtras
    }
    
    func calcularImpuestoRenta(_ baseImponible: Double) -> Double {
        let tramo: Double
        if baseImponible <= 5 * UIT {
            tramo = 0.08
        } else if baseImponible <= 20 * UIT {
            tramo = 0.14
        } else if baseImponible <= 35 * UIT {
            tramo = 0.17
        } else if baseImponible <= 45 * UIT {
            tramo = 0.20
        } else {
            tramo = 0.30
        }
        
        return (baseImponible * tramo) / 12
    }
    
    func calcularDescuentoEPS() -> Double {
        // Lógica para calcular el descuento de EPS basado en la entidad seleccionada
        var porcentajeDescuento: Double = 0.0
        
        switch epsSeleccionado {
        case "Rímac":
            if sueldoBruto <= 2500 {
                porcentajeDescuento = 0.025 // 2.5% para sueldos hasta 2500
            } else if sueldoBruto <= 5000 {
                porcentajeDescuento = 0.035 // 3.5% para sueldos hasta 5000
            } else {
                porcentajeDescuento = 0.045 // 4.5% para sueldos mayores a 5000
            }
        case "Pacífico":
            if sueldoBruto <= 2500 {
                porcentajeDescuento = 0.03 // 3% para sueldos hasta 2500
            } else if sueldoBruto <= 5000 {
                porcentajeDescuento = 0.04 // 4% para sueldos hasta 5000
            } else {
                porcentajeDescuento = 0.05 // 5% para sueldos mayores a 5000
            }
        case "Essalud":
            porcentajeDescuento = 0.09 // Essalud generalmente es el 9% del sueldo bruto
        default:
            break
        }
        
        return sueldoBruto * porcentajeDescuento
    }
}

#Preview {
    ContentView()
}


