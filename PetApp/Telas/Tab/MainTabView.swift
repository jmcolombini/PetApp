//
//  MainTabView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 29/01/25.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tabs = .pets
    @Binding var show: Bool
    var body: some View {
        if selectedTab == .pets {
            MyPetsView()
        } else if selectedTab == .ajustes {
            SettingsView()
        }
        CustomTabBar(selectedTab: $selectedTab)
    }
}

#Preview {
    MainTabView(show: .constant(true))
        .environmentObject(PetViewModel())
}

enum Tabs: Int {
    case pets = 0
    case ajustes = 1
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Settings View")
            Spacer()
        }
    }
}
