//
//  Pet.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import Foundation
import PhotosUI
import SwiftData

@Model
class Pet: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
    var imageURL: Data
    var isSelected: Bool
    
    init(name: String, age: Int, imageURL: UIImage, isSelected: Bool) {
        self.name = name
        self.age = age
        self.imageURL = imageURL.pngData()!
        self.isSelected = isSelected
    }
}
