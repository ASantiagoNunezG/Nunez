//
//  ContentView.swift
//  Actividad01
//
//  Created by Mac13 on 19/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Aplicaciones de Tecsup en SwiftUI!")
            .font(.title)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding()
            Text("Desarrollado por: Nuñez")
        }
        .padding(20)
        HStack(alignment: .center, spacing: 20) {
            Text("Actividad01")
            Text("Actividad02")
            Text("Actividad03")
        }
        ZStack{
            Rectangle()
                .fill(Color.blue)
                .frame(width: 200, height: 200)
            Text("Texto encima de la imagen")
                .foregroundStyle(.white)
        }
        
    }
}

#Preview {
    ContentView()
}
