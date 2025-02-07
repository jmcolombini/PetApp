//
//  AddPetView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 30/01/25.
//

import SwiftUI

struct AddPetView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State var name = ""
    @State var birthdate = Date()
    @State var animal: Int = 1
    @State var breed: Int = 1
    @State var sexo: Int = 1
    var listOfGenders = ["Macho", "Fêmea"]
    
    var body: some View {
        VStack {
            
            // Camera Image
            
            ZStack {
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Image(systemName: "circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .fontWeight(.thin)
            }
            .padding(8)
            .foregroundStyle(Color(red: 1, green: 0.72, blue: 0.29))
            VStack(spacing: 15) {
                // Name Text Field
                TextFieldComponent(title: "Nome", textFieldTitle: "", spacing: 8, textInput: $name)
                
                // Date Picker
                VStack(alignment: .leading, spacing: 8) {
                    Text("Data de nascimento")
                        .fontWeight(.medium)
                        .padding(.horizontal)
                    
                    HStack {
                        DatePicker("\(birthdate.formatted(date: .long, time: .omitted))", selection: $birthdate, in: ...Date(), displayedComponents: .date)
                            .labelsHidden()
                            .padding()
                        
                        Spacer()
                        
                        Image(systemName: "calendar")
                            .padding(.horizontal)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                    }
                    
                }
            }
            .padding(.bottom)
            
            // Gender Picker
            
           

            
            // Save Button
            Button {
                let pet = Pet(name: "Lia", age: 2, imageURL: .lia, isSelected: true)
                modelContext.insert(pet)
                dismiss()
            } label: {
                Text("Salvar")
                    .font(.system(size: 18, weight: .medium))
                    .frame(width: 300, height: 50)
                    .foregroundStyle(.black)
                    .background(Color(red: 1, green: 0.91, blue: 0.49))
                    .clipShape(RoundedRectangle(cornerRadius: 40))
            }
        }
        .padding(50)
    }
}

#Preview {
    AddPetView()
        .modelContainer(for: Pet.self)
}
