//
//  PetDetailView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 06/02/25.
//

import SwiftUI

struct PetDetailView: View {
    var body: some View {
        NavigationStack {
            // VStack principal
            VStack(spacing: 83) {
                // VStack Imagem e Nome
                VStack(spacing: 10) {
                    Image(.mite)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
                    Text("Mite")
                        .font(.system(size: 32, weight: .semibold))
                        
                }
                VStack(spacing: 23) {
                    NavigationLink {
                        
                    } label: {
                        CollapsedPickerView(name: "Agenda", description: "Alarmes, remédios e rotina", icon: "calendar.circle.fill", color: Color(red: 1, green: 0.34, blue: 0.34), height: 100)
                    }
                    CollapsedPickerView(name: "Saúde", description: "Vacinas, remédiose consultas", icon: "heart.circle", color: Color(red: 0.15, green: 0.79, blue: 0.59), height: 100)
                    CollapsedPickerView(name: "Passeios", description: "Registre suas atividades", icon: "point.bottomleft.forward.to.arrow.triangle.uturn.scurvepath.fill", color: Color(red: 1, green: 0.65, blue: 0.2), height: 100)
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    PetDetailView()
}
