//
//  Ventana03.swift
//  Actividad01
//
//  Created by Mac13 on 19/11/24.
//

import SwiftUI

struct Ventana03: View {
    
    @State private var altura: String = ""
    @State private var edad: String = ""
    @State private var genero: String = "Hombre"
    @State private var pesoIdeal: Double?
    
    let generos = ["Hombre", "Mujer"]
    
    var body: some View {
        
        NavigationView{
            VStack(spacing: 20){
                Text("Calculadora de Peso Ideal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                //Campo para ingresar la altura
                TextField("Ingrese su altura en cm", text: $altura)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                //Campito para la edad(opcional segun el laboratorio)
                TextField("Ingrese su edad (esto es opcional)", text: $edad)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                //Selector de género
                Picker("Seleccione su género", selection: $genero){
                    ForEach(generos, id:\.self){
                        genero in Text(genero)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                //Boton para calcular el pesoo ideal
                Button(action: calcularPesoIdeal){
                    Text("Calcular Peso Ideal")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                Text("Desarrollado Por Nuñez - 2024")
                //Mostrar resultado
                if let peso = pesoIdeal{
                    Text("Peso Ideal:\(String(format:"%.1f", peso))kg")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                }
                Spacer()
            }
        }
    }
    //Funcion para calcular el pesoideal
    func calcularPesoIdeal(){
        guard let alturaCm = Double(altura) else{
            pesoIdeal = nil
            return
        }
        //Formula del peso ideal basada en el género
        if genero == "Hombre"{
            pesoIdeal = 50 + 0.9 * (alturaCm - 152)
        }else if genero == "Mujer"{
            pesoIdeal = 45.5 + 0.9 * (alturaCm - 152)
        }
    }
}

#Preview {
    Ventana03()
}
