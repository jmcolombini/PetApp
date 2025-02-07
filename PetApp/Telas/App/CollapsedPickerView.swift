//
//  CollapsedPickerView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 31/01/25.
//

import SwiftUI

struct CollapsedPickerView: View {
    let name: String
    let description: String
    let icon: String
    let color: Color
    var height: Int
    
    var body: some View {
        // Main Hstack
        HStack {
            // Vstack da esquerda
            VStack(alignment: .leading) {
                //Imagem e título
                HStack {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(color)
                    Text(name)
                        .foregroundStyle(.black)
                        .font(.system(size: 20))
                }
                
                Text(description)
                    .font(.system(size: 17))
                    .foregroundStyle(Color(red: 0.47, green: 0.47, blue: 0.47))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
        }
        .padding(.horizontal, 22)
        .frame(height: CGFloat(height))
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
        .cornerRadius(30)
        .padding(.horizontal, 30)
    }
}

#Preview {
    CollapsedPickerView(name: "Agenda", description: "Alarmes, remédios e rotina", icon: "calendar.circle.fill", color: Color(red: 1, green: 0.34, blue: 0.34), height: 100)
}
