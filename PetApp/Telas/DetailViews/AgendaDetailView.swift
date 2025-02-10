//
//  AgendaDetailView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 06/02/25.
//

import SwiftUI

struct AgendaDetailView: View {
    @State var showSheet = false
    var body: some View {
        NavigationStack {
            VStack {
//                DetailViewComponent(showSheet: $showSheet, title: "Rotina")
//                    .sheet(isPresented: $showSheet) {
//                        HomeView()
//                    }
                NavigationLink {
                    HomeView()
                } label: {
                    Image(systemName: "plus")
                }
                Spacer()
            }
            .padding(.top)
        }
    }
}

#Preview {
    AgendaDetailView()
}
