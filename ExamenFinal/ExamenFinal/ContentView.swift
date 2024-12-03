//
//  ContentView.swift
//  ExamenFinal
//
//  Created by Mac13 on 3/12/24.
//


import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Iniciar Sesión")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
                TextField("Correo electrónico", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                
                SecureField("Contraseña", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if email == "abraham@gmail.com" && password == "12345" {
                        isLoggedIn = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Iniciar Sesión")
                        .padding()
                        
                        .foregroundColor(.white)
                        .cornerRadius(20)
                } .background(Color.green)
                    .cornerRadius(10)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Correo o contraseña incorrectos"), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(destination: OptionsView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Text("TECSUP, By Nuñez")
            }
            .padding()
        }
    }
}
//pantalla de seleccion de opciones
struct OptionsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Selecciona una opción: 😊")
                .font(.title)
                .padding()
            
            NavigationLink(destination: RepsolFormView()) {
                Text("Repsol")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: BBVAFormView()) {
                Text("BBVA")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: BCPFormView()) {
                Text("Banco de Crédito")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            NavigationLink(destination: Beca18FormView()) {
                Text("Beca 18")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
//otra pantalla de seleccion
struct RepsolFormView: View {
    @State private var dni: String = ""
    @State private var isWorker: Bool = false
    @State private var selectedDepartment: String = "Redes y Comunicaciones"
    @State private var navigateToResult = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("DNI", text: $dni)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Toggle("¿Eres trabajador?", isOn: $isWorker)
                .padding()
            
            Picker("Selecciona una carrera", selection: $selectedDepartment) {
                Text("Redes y Comunicaciones").tag("Redes y Comunicaciones")
                Text("Software").tag("Software")
                Text("Química").tag("Química")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            NavigationLink(destination: RepsolResultView(dni: dni, isWorker: isWorker, department: selectedDepartment), isActive: $navigateToResult) {
                Button("Continuar") {
                    navigateToResult = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}
//otra pantalla
struct RepsolResultView: View {
    let dni: String
    let isWorker: Bool
    let department: String
    
    var coverage: Int {
        switch department {
        case "Redes y Comunicaciones": return 90
        case "Software": return 80
        case "Química": return 100
        default: return 0
        }
    }
    
    let totalCost = 54000
    
    var body: some View {
        let coveredAmount = totalCost * coverage / 100
        let uncoveredAmount = totalCost - coveredAmount
        
        VStack(spacing: 20) {
            Text("Resultados para DNI: \(dni)")
            Text("Carrera: \(department)")
            Text("Cobertura: \(coverage)%").foregroundColor(.green)
            Text("Monto cubierto: S/ \(coveredAmount)")
            Text("Monto no cubierto: S/ \(uncoveredAmount)").foregroundColor(.red)
        }
        .padding()
    }
}
//--------------------------
struct BBVAFormView: View {
    @State private var dni: String = ""
    @State private var isWorker: Bool = false
    @State private var selectedDepartment: String = "Big Data"
    @State private var modeladoYears: Int = 2
    @State private var navigateToResult = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("DNI", text: $dni)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            Toggle("¿Eres trabajador?", isOn: $isWorker)
                .padding()
            
            Picker("Selecciona una carrera", selection: $selectedDepartment) {
                Text("Big Data").tag("Big Data")
                Text("Modelado").tag("Modelado")
                Text("Aviónica").tag("Aviónica")
            }
            .pickerStyle(SegmentedPickerStyle())
            .onChange(of: selectedDepartment) { newValue in
                // Si selecciona "Modelado", mostrar opción de duración.
                if newValue == "Modelado" {
                    modeladoYears = 2
                }
            }
            
            if selectedDepartment == "Modelado" {
                Picker("Duración de la carrera", selection: $modeladoYears) {
                    Text("2 años").tag(2)
                    Text("3 años").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            NavigationLink(destination: BBVAResultView(dni: dni, department: selectedDepartment, years: modeladoYears), isActive: $navigateToResult) {
                Button("Continuar") {
                    navigateToResult = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }
}
//Resultados
struct BBVAResultView: View {
    let dni: String
    let department: String
    let years: Int // Solo relevante para "Modelado"
    
    var coverage: Int {
        switch department {
        case "Big Data":
            return 90
        case "Modelado":
            return years == 2 ? 90 : 80
        case "Aviónica":
            return 80
        default:
            return 0
        }
    }
    
    let totalCost = 54000
    
    var body: some View {
        let coveredAmount = totalCost * coverage / 100
        let uncoveredAmount = totalCost - coveredAmount
        
        VStack(spacing: 20) {
            Text("Resultados para DNI: \(dni)")
            Text("Carrera: \(department)")
            Text("Cobertura: \(coverage)%").foregroundColor(.green)
            Text("Monto cubierto: S/ \(coveredAmount)")
            Text("Monto no cubierto: S/ \(uncoveredAmount)").foregroundColor(.red)
        }
        .padding()
    }
}
//----------------------------
struct BCPFormView: View {
    @State private var dni: String = ""
    @State private var isWorker: Bool = false
    @State private var finalAverage: String = ""
    @State private var selectedDepartment: String = "Mecánica"
    @State private var navigateToResult = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("DNI", text: $dni)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .onChange(of: dni) { newValue in
                    // Limitar a números con un máximo de 8 caracteres
                    dni = String(newValue.prefix(8))
                }
            Toggle("¿Eres trabajador?", isOn: $isWorker)
                .padding()
            
            TextField("Promedio final", text: $finalAverage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Picker("Selecciona una carrera", selection: $selectedDepartment) {
                Text("Mecánica").tag("Mecánica")
                Text("Software").tag("Software")
                Text("Electrónica").tag("Electrónica")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if let average = Double(finalAverage), average >= 0 && average <= 20 {
                NavigationLink(
                    destination: BCPResultView(
                        dni: dni,
                        department: selectedDepartment,   // 'department' va antes
                        finalAverage: average
                    ),
                    isActive: $navigateToResult
                ) {
                    Button("Continuar") {
                        navigateToResult = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                Text("Ingresa un promedio válido entre 0 y 20")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}


//Rsultados de BCP
struct BCPResultView: View {
    let dni: String
    let department: String
    let finalAverage: Double
    
    let totalCost = 54000
    
    var coverage: Int {
        switch department {
        case "Mecánica":
            return 90
        case "Software":
            if finalAverage >= 18 {
                return 100
            } else if finalAverage >= 13 {
                return 50
            } else {
                return 0
            }
        case "Electrónica":
            return 80
        default:
            return 0
        }
    }
    
    var body: some View {
        let coveredAmount = totalCost * coverage / 100
        let uncoveredAmount = totalCost - coveredAmount
        
        VStack(spacing: 20) {
            Text("Resultados para DNI: \(dni)")
                .font(.title2)
            Text("Carrera: \(department)")
            Text("Promedio final: \(String(format: "%.2f", finalAverage))")
            Text("Cobertura: \(coverage)%")
                .foregroundColor(coverage > 0 ? .green : .red)
            
            if coverage > 0 {
                Text("Monto cubierto: S/ \(coveredAmount)")
                Text("Monto no cubierto: S/ \(uncoveredAmount)")
                    .foregroundColor(.red)
            } else {
                Text("No cumple con los requisitos para obtener cobertura")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

//------------
struct Beca18FormView: View {
    @State private var dni: String = ""
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var birthDate = Date()
    @State private var finalAverage: String = ""
    @State private var age: Int = 0
    @State private var department: String = "Redes y Comunicaciones"
    @State private var navigateToResult = false
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Nombres", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Apellidos", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Fecha de nacimiento", selection: $birthDate, displayedComponents: .date)
                .onChange(of: birthDate) { _ in
                    let calendar = Calendar.current
                    let currentDate = Date()
                    let ageComponents = calendar.dateComponents([.year], from: birthDate, to: currentDate)
                    age = ageComponents.year ?? 0
                }
            
            TextField("DNI", text: $dni)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            
            TextField("Promedio final", text: $finalAverage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Picker("Selecciona una carrera", selection: $department) {
                Text("Redes y Comunicaciones").tag("Redes y Comunicaciones")
                Text("Software").tag("Software")
                Text("Química").tag("Química")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if age >= 16 {
                NavigationLink(
                    destination: Beca18ResultView(
                        dni: dni,
                        fullName: "\(name) \(lastName)",
                        finalAverage: Double(finalAverage) ?? 0,
                        age: age,
                        department: department
                    ),
                    isActive: $navigateToResult
                ) {
                    Button("Continuar") {
                        navigateToResult = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            } else {
                Text("Debes tener al menos 16 años para aplicar a Beca 18")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

//Resultados de beca 18
struct Beca18ResultView: View {
    let dni: String
    let fullName: String
    let finalAverage: Double
    let age: Int
    let department: String

    let totalCost = 54000
    
    var coverage: Int {
        if age >= 16 {
            if finalAverage >= 17 {
                return 100
            } else if finalAverage >= 13 {
                return 50
            }
        }
        return 0
    }
    
    var body: some View {
        let coveredAmount = totalCost * coverage / 100
        let uncoveredAmount = totalCost - coveredAmount
        
        VStack(spacing: 20) {
            Text("Resultados para DNI: \(dni)")
                .font(.title2)
            Text("Nombre completo: \(fullName)")
            Text("Edad: \(age)")
            Text("Carrera: \(department)")
            Text("Promedio final: \(String(format: "%.2f", finalAverage))")
            Text("Cobertura: \(coverage)%")
                .foregroundColor(coverage > 0 ? .green : .red)
            
            if coverage > 0 {
                Text("Monto cubierto: S/ \(coveredAmount)")
                Text("Monto no cubierto: S/ \(uncoveredAmount)")
                    .foregroundColor(.red)
            } else {
                Text("No cumple con los requisitos para Beca 18")
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
