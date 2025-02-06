//
//  PetViewModel.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 31/01/25.
//

import Foundation

class PetViewModel: ObservableObject {
    @Published var pets: [Pet]
    
    init() {
        pets = allPets
    }
}

let allPets: [Pet] = [Pet(name: "Mite", imageURL: .mite, isSelected: true)]
