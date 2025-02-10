//
//  PetView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 08/02/25.
//

import SwiftUI

struct PetView: View {
    
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 190) {
                        cover
                        VStack(spacing: 25) {
                            NavigationLink {
                                SaudeDetailView()
                            } label: {
                                HStack {
                                    // Vstack da esquerda
                                    VStack(alignment: .leading) {
                                        //Imagem e título
                                        HStack {
                                            Image(systemName: "heart.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                                .foregroundStyle(Color(red: 0.15, green: 0.79, blue: 0.59))
                                            Text("Saúde")
                                                .foregroundStyle(.black)
                                                .font(.system(size: 20))
                                        }
                                        
                                        Text("Vacinas, remédios e consultas")
                                            .font(.system(size: 17))
                                            .foregroundStyle(Color(red: 0.47, green: 0.47, blue: 0.47))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                                }
                                .padding(.horizontal, 37)
                            }
                            
                            
                            
                            Divider()
                                .padding(.horizontal, 15)
                            NavigationLink {
                                Text("Oi")
                            } label: {
                                HStack {
                                    // Vstack da esquerda
                                    VStack(alignment: .leading) {
                                        //Imagem e título
                                        HStack {
                                            Image(systemName: "point.bottomleft.forward.to.arrow.triangle.uturn.scurvepath.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 24, height: 24)
                                                .foregroundStyle(Color(red: 1, green: 0.65, blue: 0.2))
                                            Text("Atividade")
                                                .foregroundStyle(.black)
                                                .font(.system(size: 20))
                                        }
                                        
                                        Text("Registre suas caminhadas")
                                            .font(.system(size: 17))
                                            .foregroundStyle(Color(red: 0.47, green: 0.47, blue: 0.47))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(Color(red: 0.5, green: 0.5, blue: 0.5))
                                }
                                .padding(.horizontal, 37)
                            }
                           
                        }
                        .frame(width: .infinity, height: 220)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                        .cornerRadius(30)
                        .padding(.horizontal, 20)
                        .shadow(color: .black.opacity(0.15), radius: 15, x: 0, y: 4)
                        
                        
                    }
                    
                    
                }
                .background(Color(.white))
                .ignoresSafeArea()
                
                Button {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.body.weight(.bold))
                        .foregroundStyle(Color("cinza"))
                        .padding(8)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.horizontal, 20)
                .padding(.vertical, 50)
                .ignoresSafeArea()
            }
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 400)
        .foregroundStyle(.black)
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
        .overlay(
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Gata - 4 anos".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                Text("Lia")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Rotina")
                        .font(.title2.weight(.semibold))
                    
                    
                    Text("7:00 Passear\n8:00 Botar comida\n17:00 Botar comida")
                        .font(.footnote)
                        .matchedGeometryEffect(id: "text", in: namespace)
                    
                }
            }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .shadow(color: .black.opacity(0.15), radius: 15, x: 0, y: 4)
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
                .offset(y: 250)
                .padding(20)
            
            
        )
    }
}

struct PetView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        PetView(namespace: namespace, show: .constant(true))
    }
}
