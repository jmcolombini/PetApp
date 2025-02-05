//
//  CustomTabBar.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 31/01/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        VStack(spacing: 10) {
            Divider()
            HStack {
                Button {
                    withAnimation(.snappy) {
                        selectedTab = .pets
                    }
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: "pawprint.fill")
                            .foregroundStyle(selectedTab == .pets ? .yellow : Color(.systemGray2))
                        Text("Meus Bichos")
                            .foregroundStyle(selectedTab == .pets ? .black : Color(.systemGray2))
                    }
                    .font(.system(size: 16))
                    .padding(.leading, 70)
                }
                Spacer()
                Button {
                    withAnimation(.snappy) {
                        selectedTab = .ajustes
                    }
                } label: {
                    VStack(spacing: 2) {
                        Image(systemName: "gearshape")
                            .foregroundStyle(selectedTab == .ajustes ? .yellow : Color(.systemGray2))
                        Text("Ajustes")
                            .foregroundStyle(selectedTab == .ajustes ? .black : Color(.systemGray2))
                    }
                    .font(.system(size: 16))
                    .padding(.trailing, 70)
                }
                
            }
        }
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.pets))
}

