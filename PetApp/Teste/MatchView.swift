//
//  SwiftUIView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 08/02/25.
//

import SwiftUI

struct MatchView: View {
    @Namespace var namespace
    @State var show = false
    
    var body: some View {
        ZStack {
            if !show {
                PetItem(namespace: namespace, show: $show)
                
            } else {
                PetView(namespace: namespace, show: $show)
            }
        }
    }
}

#Preview {
    MatchView()
}
