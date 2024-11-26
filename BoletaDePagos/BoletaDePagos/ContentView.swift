//
//  ContentView.swift
//  BoletaDePagos
//
//  Created by nunez on 26/11/24.
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
                    .foregroundColor(.blue)
                    .padding(.top, 30)
                
                // Sueldo Bruto
                VStack(alignment: .leading, spacing: 8) {
                    Text("💵 Sueldo Bruto Mensual")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
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
                        .foregroundColor(.blue)
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
                            .foregroundColor(.blue)
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
                        .foregroundColor(.blue)
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
                        .foregroundColor(.blue)
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
                .background(Color.white)
                .foregroundColor(.blue)
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
                        .foregroundColor(.blue)
                    Text("🔵 Sueldo anual estimado: S/ \(String(format: "%.2f", sueldoBruto * 12))")
                        .font(.body)
                        .foregroundColor(.black)
                    Text("🔴 Diferencia Sueldo B. y Sueldo N.: S/ \(String(format: "%.2f", sueldoBruto - sueldoNeto))")
                        .font(.body)
                        .foregroundColor(.black)
                    Text("🟢 Total anual con ingresos extras: S/ \(String(format: "%.2f", (sueldoBruto + ingresosExtras) * 12))")
                        .font(.body)
                        .foregroundColor(.black)
                    Text("🟡 Descuento de EPS por \(numeroMiembros) miembro(s): S/ \(String(format: "%.2f", descuentoEPS))")
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
        
        let sueldoAnual = sueldoBruto * 12
        let baseImponible = sueldoAnual - (UIT * 7)
        impuestoRenta = calcularImpuestoRenta(baseImponible)
        
        descuentoEPS = tieneEPS ? calcularDescuentoEPS() : 0.0
        
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
        var porcentajeDescuento: Double = 0.0
        switch epsSeleccionado {
        case "Essalud":
            porcentajeDescuento = 0.09
        case "Rímac":
            porcentajeDescuento = 0.04
        case "Pacífico":
            porcentajeDescuento = 0.035
        default:
            porcentajeDescuento = 0.0
        }
        return sueldoBruto * porcentajeDescuento * Double(numeroMiembros)
    }
}

#Preview {
    ContentView()
}




