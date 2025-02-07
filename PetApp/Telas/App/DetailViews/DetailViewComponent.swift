//
//  DetailViewComponent.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 06/02/25.
//

import SwiftUI

struct DetailViewComponent: View {
    @Binding var showSheet: Bool
    @State var title: String
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.black)
                .font(.system(size: 28))
                .fontWeight(.semibold)
            
            Spacer()
            
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.black)
                    
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    DetailViewComponent(showSheet: .constant(true) ,title: "Rotina")
}
