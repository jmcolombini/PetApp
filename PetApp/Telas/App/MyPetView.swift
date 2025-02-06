//
//  MyPetView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import SwiftUI

struct MyPetView: View {
    @EnvironmentObject var viewModel: PetViewModel
    @State var selectedPet: Pet
    
    var body: some View {
        NavigationView {
            ZStack {
                // Conteúdo principal da tela
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ScrollView {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.pets) { pet in
                                    PetCardView(imageName: UIImage(data: pet.imageURL)!, petName: pet.name)
                                }
                            }
                            .padding(.horizontal, 30)
                            Spacer()
                        }
                        .padding(.top)
                        .scrollTargetBehavior(.paging)
                    }
                    
                    
                }
                .navigationBarItems(
                    trailing:
                        NavigationLink {
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        })
                .navigationTitle("Meus Bichos")
                
                // Toolbar com gradiente
            }
        }
    }
}

struct PetCardView: View {
    var imageName: UIImage
    var petName: String
    
    var body: some View {
        VStack(spacing: 15) {
            Image(uiImage: imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 170)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Text(petName)
                        .font(.system(size: 22))
                    Spacer()
                }
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 9)
            .font(.largeTitle)
            .foregroundStyle(.white)
            .fontWeight(.medium)
        }
    }
}


#Preview {
    SelectedPetView()
        .environmentObject(PetViewModel())
}

#Preview {
    PetCardView(imageName: .mite, petName: "Mite")
}
