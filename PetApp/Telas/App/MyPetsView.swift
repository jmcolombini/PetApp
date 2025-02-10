//
//  MyPetsView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 01/02/25.
//

import SwiftUI
import SwiftData

struct MyPetsView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @State var showSheet = false
    @Environment(\.modelContext) var modelContext
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible())]
    @Query var pets: [Pet]
    
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
                            .presentationDetents([.height(450)])
                            .presentationDragIndicator(.visible)
                        
                    }
                }
                .padding(16)
                
                if !pets.isEmpty {
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(pets) { pet in
                            NavigationLink {
                                PetDetailView(pet: pet)
                            } label: {
                                PetCardView(imageURL: UIImage(data: pet.imageURL)!, petName: pet.name)
                            }
                            .contextMenu {
                                Button(role: .destructive){
                                    withAnimation {
                                        modelContext.delete(pet)
                                    }
                                } label: {
                                    Label("Deletar pet", systemImage: "trash")
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                } else {
                    Spacer().frame(height: 100)
                    Text("Parece que você não adicionou um pet ainda. Clique no + para adicionar!")
                        .padding(.horizontal, 30)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.gray)
                        .font(.title)
                        
                }
                
                Spacer()
                
            }
            .navigationBarHidden(true)
            .navigationTitle("Meus bichos")
        }
    }
}

#Preview {
    MyPetsView()
        .modelContainer(for: Pet.self, inMemory: true)
        .environmentObject(PetViewModel())
}


struct NewMyPetView: View {
    var name: String
    var age: Int
    var imageURL: UIImage
    var body: some View {
        ZStack {
            VStack {
                Image(uiImage: imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 160)
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
            
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .inset(by: 0.5)
                .stroke(Color(red: 1, green: 0.65, blue: 0), lineWidth: 1)
            
        }
    }
}
