//
//  PetAppApp.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import SwiftUI

@main
struct PetAppApp: App {
    @StateObject var viewModel: PetViewModel = PetViewModel()
    var body: some Scene {
        WindowGroup {
            EnterView()
        }
        .environmentObject(viewModel)
    }
}
