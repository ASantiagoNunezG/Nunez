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
                    .font(.custom("Courier New", size: 36))  // Tipografía retro tipo máquina de escribir
                    .foregroundColor(Color.white)
                    .padding(.bottom, 20)
                
                TextField("Correo electrónico", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.white.opacity(0.7))  // Fondo retro
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                
                SecureField("Contraseña", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                
                Button(action: {
                    if email == "abraham@gmail.com" && password == "12345" {
                        isLoggedIn = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Iniciar Sesión")
                        .padding()
                        .font(.title3)
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Correo o contraseña incorrectos"), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(destination: OptionsView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Text("TECSUP, By Nuñez")
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .padding(.top, 20)
            }
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.6), Color.orange.opacity(0.4)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
            .cornerRadius(20)
            .shadow(radius: 10)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct OptionsView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Selecciona una opción: 😊")
                .font(.custom("Courier New", size: 30))  // Tipografía retro
                .foregroundColor(Color.white)
                .padding()
            
            // Botón de Repsol
            NavigationLink(destination: RepsolFormView()) {
                Text("Repsol")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.green.opacity(0.8))  // Color retro con opacidad
                    .cornerRadius(12)
            }
            
            // Botón de BBVA
            NavigationLink(destination: BBVAFormView()) {
                Text("BBVA")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(12)
            }
            
            // Botón de Banco de Crédito
            NavigationLink(destination: BCPFormView()) {
                Text("Banco de Crédito")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.orange.opacity(0.8))
                    .cornerRadius(12)
            }
            
            // Botón de Beca 18
            NavigationLink(destination: Beca18FormView()) {
                Text("Beca 18")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// Pantalla de formulario de Repsol
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
                .padding()
                .background(Color.white.opacity(0.2)) // Fondo con opacidad para estilo retro
                .cornerRadius(10)
            
            Toggle("¿Eres trabajador?", isOn: $isWorker)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
            
            Picker("Selecciona una carrera", selection: $selectedDepartment) {
                Text("Redes y Comunicaciones").tag("Redes y Comunicaciones")
                Text("Software").tag("Software")
                Text("Química").tag("Química")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            NavigationLink(destination: RepsolResultView(dni: dni, isWorker: isWorker, department: selectedDepartment), isActive: $navigateToResult) {
                Button("Continuar") {
                    navigateToResult = true
                }
                .padding()
                .background(Color.green.opacity(0.8))  // Color retro lofi
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// Pantalla de resultados de Repsol
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
                .font(.custom("Courier New", size: 24))  // Tipografía retro
                .foregroundColor(.white)
            Text("Carrera: \(department)")
                .font(.custom("Courier New", size: 24))
                .foregroundColor(.white)
            Text("Cobertura: \(coverage)%")
                .foregroundColor(.green)
                .font(.custom("Courier New", size: 24))
            Text("Monto cubierto: S/ \(coveredAmount)")
                .foregroundColor(.white)
                .font(.custom("Courier New", size: 24))
            Text("Monto no cubierto: S/ \(uncoveredAmount)")
                .foregroundColor(.red)
                .font(.custom("Courier New", size: 24))
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

//--------------------------
// Pantalla de formulario BBVA
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
                .padding()
                .background(Color.white.opacity(0.2))  // Fondo retro con opacidad
                .cornerRadius(10)
            
            Toggle("¿Eres trabajador?", isOn: $isWorker)
                .padding()
                .background(Color.white.opacity(0.2))  // Fondo retro con opacidad
                .cornerRadius(10)
            
            Picker("Selecciona una carrera", selection: $selectedDepartment) {
                Text("Big Data").tag("Big Data")
                Text("Modelado").tag("Modelado")
                Text("Aviónica").tag("Aviónica")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedDepartment) { newValue in
                // Si selecciona "Modelado", mostrar opción de duración
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
                .padding()
            }
            
            NavigationLink(destination: BBVAResultView(dni: dni, department: selectedDepartment, years: modeladoYears), isActive: $navigateToResult) {
                Button("Continuar") {
                    navigateToResult = true
                }
                .padding()
                .background(Color.blue.opacity(0.8))  // Color retro lofi
                .foregroundColor(.white)
                .cornerRadius(12)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// Pantalla de resultados BBVA
struct BBVAResultView: View {
    let dni: String
    let department: String
    let years: Int  // Solo relevante para "Modelado"
    
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
                .font(.custom("Courier New", size: 24))  // Tipografía retro
                .foregroundColor(.white)
            Text("Carrera: \(department)")
                .font(.custom("Courier New", size: 24))
                .foregroundColor(.white)
            Text("Cobertura: \(coverage)%")
                .foregroundColor(.green)
                .font(.custom("Courier New", size: 24))
            Text("Monto cubierto: S/ \(coveredAmount)")
                .foregroundColor(.white)
                .font(.custom("Courier New", size: 24))
            Text("Monto no cubierto: S/ \(uncoveredAmount)")
                .foregroundColor(.red)
                .font(.custom("Courier New", size: 24))
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

//----------------------------
// Pantalla de formulario BCP
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
                .padding()
                .background(Color.white.opacity(0.2))  // Fondo retro con opacidad
                .cornerRadius(10)
            
            Toggle("¿Eres trabajador?", isOn: $isWorker)
                .padding()
                .background(Color.white.opacity(0.2))  // Fondo retro con opacidad
                .cornerRadius(10)
            
            TextField("Promedio final", text: $finalAverage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
                .background(Color.white.opacity(0.2))  // Fondo retro con opacidad
                .cornerRadius(10)
            
            Picker("Selecciona una carrera", selection: $selectedDepartment) {
                Text("Mecánica").tag("Mecánica")
                Text("Software").tag("Software")
                Text("Electrónica").tag("Electrónica")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
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
                    .background(Color.blue.opacity(0.8))  // Color retro lofi
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
            } else {
                Text("Ingresa un promedio válido entre 0 y 20")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

// Pantalla de resultados BCP
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
                .font(.custom("Courier New", size: 24))  // Tipografía retro
                .foregroundColor(.white)
            Text("Carrera: \(department)")
                .font(.custom("Courier New", size: 24))
                .foregroundColor(.white)
            Text("Promedio final: \(String(format: "%.2f", finalAverage))")
                .font(.custom("Courier New", size: 24))
                .foregroundColor(.white)
            Text("Cobertura: \(coverage)%")
                .foregroundColor(coverage > 0 ? .green : .red)
                .font(.custom("Courier New", size: 24))
            
            if coverage > 0 {
                Text("Monto cubierto: S/ \(coveredAmount)")
                    .foregroundColor(.white)
                    .font(.custom("Courier New", size: 24))
                Text("Monto no cubierto: S/ \(uncoveredAmount)")
                    .foregroundColor(.red)
                    .font(.custom("Courier New", size: 24))
            } else {
                Text("No cumple con los requisitos para obtener cobertura")
                    .foregroundColor(.red)
                    .font(.custom("Courier New", size: 24))
            }
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.7), Color.orange.opacity(0.5)]), startPoint: .top, endPoint: .bottom))  // Fondo retro lofi
        .cornerRadius(20)
        .shadow(radius: 10)
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
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            
            TextField("Apellidos", text: $lastName)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
            
            DatePicker("Fecha de nacimiento", selection: $birthDate, displayedComponents: .date)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .onChange(of: birthDate) { _ in
                    let calendar = Calendar.current
                    let currentDate = Date()
                    let ageComponents = calendar.dateComponents([.year], from: birthDate, to: currentDate)
                    age = ageComponents.year ?? 0
                }
            
            TextField("DNI", text: $dni)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .keyboardType(.numberPad)
            
            TextField("Promedio final", text: $finalAverage)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 2)
                .keyboardType(.decimalPad)
            
            Picker("Selecciona una carrera", selection: $department) {
                Text("Redes y Comunicaciones").tag("Redes y Comunicaciones")
                Text("Software").tag("Software")
                Text("Química").tag("Química")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
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
                    .shadow(radius: 2)
                }
            } else {
                Text("Debes tener al menos 16 años para aplicar a Beca 18")
                    .foregroundColor(.red)
                    .font(.subheadline)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}



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
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


#Preview {
    LoginView()
}
