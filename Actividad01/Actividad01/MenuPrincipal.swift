//
//  MenuPrincipal.swift
//  Actividad01
//
//  Created by Mac13 on 19/11/24.
//

import SwiftUI

struct MenuPrincipal: View {
    var body: some View {
        VStack{
            NavigationView{
                List{
                    NavigationLink("Aplicación01", destination: Text("Página 2"))
                    NavigationLink("Aplicación02", destination: Text("Página 3"))
                    NavigationLink("Aplicación03", destination: Text("Página 4"))
                    NavigationLink("Aplicación04", destination: Text("Página 5"))
                }
                .navigationTitle("Menú Principal")
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .padding()
    }
}

#Preview {
    MenuPrincipal()
}
