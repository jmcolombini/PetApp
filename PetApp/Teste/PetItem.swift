//
//  PetItem.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 08/02/25.
//

import SwiftUI

struct PetItem: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text("Lia")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Gata - 4 anos".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image("lia")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .mask (
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
    }
}

struct PetItem_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PetItem(namespace: namespace, show: .constant(true))
    }
}
