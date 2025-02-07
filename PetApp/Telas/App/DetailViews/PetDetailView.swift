//
//  PetDetailView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 06/02/25.
//

import SwiftUI

struct PetDetailView: View {
    @Environment(\.modelContext) var modelContext
    var pet: Pet
    var body: some View {
        NavigationStack {
            // VStack principal
            VStack(spacing: 83) {
                // VStack Imagem e Nome
                VStack(spacing: 10) {
                    Image(uiImage: UIImage(data: pet.imageURL)!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
                    Text(pet.name)
                        .font(.system(size: 32, weight: .semibold))
                        
                }
                VStack(spacing: 23) {
                    NavigationLink {
                        AgendaDetailView()
                    } label: {
                        CollapsedPickerView(name: "Agenda", description: "Alarmes, remédios e rotina", icon: "calendar.circle.fill", color: Color(red: 1, green: 0.34, blue: 0.34), height: 100)
                    }
                    CollapsedPickerView(name: "Saúde", description: "Vacinas, remédios e consultas", icon: "heart.circle", color: Color(red: 0.15, green: 0.79, blue: 0.59), height: 100)
                    CollapsedPickerView(name: "Atividade", description: "Registre suas caminhadas", icon: "point.bottomleft.forward.to.arrow.triangle.uturn.scurvepath.fill", color: Color(red: 1, green: 0.65, blue: 0.2), height: 100)
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    PetDetailView(pet: Pet(name: "Mite", age: 2, imageURL: .mite, isSelected: true))
        .modelContainer(for: Pet.self)
}
