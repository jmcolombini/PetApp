//
//  HomeView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 08/02/25.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @State var show = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Text("Meus bichos")
                            .font(.system(size: 28, weight: .semibold))
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(.black)
                        }
                    }
                    .padding(16)
                    
                    ScrollView {
                        Color.clear.frame(height: 1)
                        if !show {
                            PetItem(namespace: namespace, show: $show)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        show.toggle()
                                    }
                                }
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .safeAreaInset(edge: .top) {
                        Color.clear.frame(height: 0)
                    }
                }
                .navigationBarHidden(true)
                .navigationTitle("Meus bichos")
                
                if show {
                    PetView(namespace: namespace, show: $show)
                }
            }
        }
        
    }
}

#Preview {
    HomeView()
}
