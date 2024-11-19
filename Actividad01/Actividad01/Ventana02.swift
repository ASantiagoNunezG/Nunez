//
//  Ventana02.swift
//  Actividad01
//
//  Created by Mac13 on 19/11/24.
//

import SwiftUI

struct Ventana02: View {
    var body: some View {
        VStack{
            Text("TECSUP - Software").font(.largeTitle)
            HStack{
                Text("Izquierda")
                Spacer()
                Text("Derecha")
            }
            .padding()
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                Text("Alumnos del 5to Ciclo")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    Ventana02()
}
