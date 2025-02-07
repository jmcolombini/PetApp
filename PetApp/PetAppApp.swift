//
//  PetAppApp.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import SwiftUI
import SwiftData

@main
struct PetAppApp: App {
    @StateObject var viewModel: PetViewModel = PetViewModel()
    var body: some Scene {
        WindowGroup {
            OnBoardingView()
        }
        .modelContainer(for: Pet.self)
        .environmentObject(viewModel)
    }
}
