//
//  ContentView.swift
//  CompraVehiculos
//
//  Created by Mac13 on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    // Variables de entrada
    @State private var precioDelVehiculo: Double = 0.0
    @State private var porcentajePagoInicial: Double = 0.0
    @State private var plazoDelCredito: Int = 12
    @State private var tasaDeInteresAnual: Double = 0.0
    @State private var costoDelSeguroAnual: Double = 0.0

    // Variables calculadas
    private var pagoInicial: Double {
        precioDelVehiculo * (porcentajePagoInicial / 100)
    }

    private var montoAFinanciar: Double {
        precioDelVehiculo - pagoInicial
    }

    private var tasaDeInteresMensual: Double {
        tasaDeInteresAnual / 12 / 100
    }

    private var cuotaMensualSinSeguro: Double {
        if tasaDeInteresMensual == 0 {
            return montoAFinanciar / Double(plazoDelCredito)
        } else {
            return montoAFinanciar * (tasaDeInteresMensual / (1 - pow(1 + tasaDeInteresMensual, -Double(plazoDelCredito))))
        }
    }

    private var seguroMensual: Double {
        costoDelSeguroAnual / 12
    }

    private var cuotaMensualTotal: Double {
        cuotaMensualSinSeguro + seguroMensual
    }

    private var costoTotalCredito: Double {
        (cuotaMensualTotal * Double(plazoDelCredito)) + pagoInicial
    }

    var body: some View {
        ZStack {
            // Fondo retro
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("💾 Simulador de Crédito")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding(.top)

                Form {
                    Section(header: Text("🚗 Datos del vehículo")
                        .font(.headline)
                        .foregroundColor(.white)) {
                        HStack {
                            Text("Precio del vehículo:")
                                .font(.subheadline)
                            Spacer()
                            TextField("0.0", value: $precioDelVehiculo, format: .currency(code: "PEN"))
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Porcentaje pago inicial (%):")
                                .font(.subheadline)
                            Spacer()
                            TextField("0", value: $porcentajePagoInicial, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                    Section(header: Text("📅 Detalles del crédito")
                        .font(.headline)
                        .foregroundColor(.white)) {
                        Picker("Plazo del crédito (meses):", selection: $plazoDelCredito) {
                            ForEach([12, 24, 36, 48, 60], id: \.self) { plazo in
                                Text("\(plazo) meses").tag(plazo)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())

                        HStack {
                            Text("Tasa de interés anual (%):")
                                .font(.subheadline)
                            Spacer()
                            TextField("0.0", value: $tasaDeInteresAnual, format: .number)
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        HStack {
                            Text("Costo del seguro anual:")
                                .font(.subheadline)
                            Spacer()
                            TextField("0.0", value: $costoDelSeguroAnual, format: .currency(code: "PEN"))
                                .keyboardType(.decimalPad)
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }

                    Section(header: Text("📋 Resultados Previos")
                        .font(.headline)
                        .foregroundColor(.white)) {
                        HStack {
                            Text("Monto del pago inicial:")
                                .font(.subheadline)
                            Spacer()
                            Text(pagoInicial, format: .currency(code: "PEN"))
                                .foregroundColor(.blue)
                        }

                        HStack {
                            Text("Monto a financiar:")
                                .font(.subheadline)
                            Spacer()
                            Text(montoAFinanciar, format: .currency(code: "PEN"))
                                .foregroundColor(.blue)
                        }

                        HStack {
                            Text("Tasa de interés mensual:")
                                .font(.subheadline)
                            Spacer()
                            Text(tasaDeInteresMensual, format: .percent)
                                .foregroundColor(.blue)
                        }
                    }

                    Section(header: Text("📊 Resultados")
                        .font(.headline)
                        .foregroundColor(.white)) {
                        HStack {
                            Text("Cuota mensual (sin seguro):")
                                .font(.subheadline)
                            Spacer()
                            Text(cuotaMensualSinSeguro, format: .currency(code: "PEN"))
                                .foregroundColor(.green)
                        }

                        HStack {
                            Text("Seguro mensual:")
                                .font(.subheadline)
                            Spacer()
                            Text(seguroMensual, format: .currency(code: "PEN"))
                                .foregroundColor(.green)
                        }

                        HStack {
                            Text("Cuota mensual total (con seguro):")
                                .font(.subheadline)
                            Spacer()
                            Text(cuotaMensualTotal, format: .currency(code: "PEN"))
                                .foregroundColor(.green)
                        }

                        HStack {
                            Text("Costo total del crédito:")
                                .font(.subheadline)
                            Spacer()
                            Text(costoTotalCredito, format: .currency(code: "PEN"))
                                .foregroundColor(.red)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.black.opacity(0.8))
                .cornerRadius(12)
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
