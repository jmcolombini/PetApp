//
//  MyPetsView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 01/02/25.
//

import SwiftUI

struct MyPetsView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @State var showSheet = false
    @State private var showAddAnimalView = false
    @State var selectedPet = 0
    @State var selectedPicker: Picker = .none
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 15)
                HStack {
                    Text("Meus bichos")
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(.black)
                            
                    }
                    .sheet(isPresented: $showSheet) {
                        AddPetView()
                    }
                }
                .padding(16)
                
                HStack(spacing: 25) {
                    NewMyPetView(name: "Lia", age: 4, imageName: "lia")
                    NewMyPetView(name: "Mite", age: 2, imageName: "mite")
                }
                .frame(minWidth: 350, alignment: .leading)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    MyPetsView()
        .environmentObject(PetViewModel())
}


struct NewMyPetView: View {
    var name: String
    var age: Int
    var imageName: String
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(alignment: .bottom) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.system(size: 16, weight: .semibold))
                            Text("\(age) anos")
                                .font(.system(size: 12))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 6)
                    .background(.white)
                }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .inset(by: 0.5)
                .stroke(Color(red: 1, green: 0.65, blue: 0), lineWidth: 1)
            
        }
    }
}
