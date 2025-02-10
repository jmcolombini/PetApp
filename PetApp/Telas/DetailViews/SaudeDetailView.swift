//
//  SaudeDetailView.swift
//  PetApp
//
//  Created by João Marcelo Colombini Cardonha on 09/02/25.
//

import SwiftUI
enum Views {
    case remedios
    case vacinas
    case consultas
}
struct SaudeDetailView: View {
    @State var selectedView: Views = .vacinas
    @Environment(\.presentationMode) var presentationMode
    @State var showSheet = false
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 33) {
                    Text("Remédios")
                        .font(.system(size: 14, weight: .medium))
                        .padding(12)
                        .background(selectedView == .remedios ? Color(red: 1, green: 0.91, blue: 0.49) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .onTapGesture {
                            selectedView = .remedios
                        }
                    Text("Vacinas")
                        .font(.system(size: 14, weight: .medium))
                        .padding(12)
                        .background(selectedView == .vacinas ? Color(red: 1, green: 0.91, blue: 0.49) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .onTapGesture {
                            selectedView = .vacinas
                        }
                    Text("Consultas")
                        .font(.system(size: 14, weight: .medium))
                        .padding(12)
                        .background(selectedView == .consultas ? Color(red: 1, green: 0.91, blue: 0.49) : Color(red: 0.98, green: 0.98, blue: 0.98))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .onTapGesture {
                            selectedView = .consultas
                        }
                }
                .padding(.top)
                Spacer().frame(height: 15)
                ScrollView {
                    Spacer().frame(height: 30)
                    VStack(spacing: 20) {
                        if selectedView == .vacinas {
                            VacinaItemView()
                            VacinaItemView()
                            VacinaItemView()
                        }
                        
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 16)
            }
            .navigationTitle("Saúde")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true) // Esconde o botão padrão
                    .navigationBarItems(leading: Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .fontWeight(.semibold)
                            Text("Voltar")
                        }
                    })
            
        }
        .overlay(alignment: .bottomTrailing) {
           
            Button {
                showSheet.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(.black)
                    .padding(14)
                    .background(Color(red: 1, green: 0.91, blue: 0.49), in: Circle())
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .sheet(isPresented: $showSheet) {
                if selectedView == .vacinas {
                    AddVacinaView()
                        .presentationDetents([.height(600)])
                        .presentationDragIndicator(.visible)
                }
               
                
            }
        }
    }
}

#Preview {
    SaudeDetailView()
}

struct VacinaItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Vacina Raiva")
                .font(.system(size: 20, weight: .regular))
            
            HStack(spacing: 8) {
                Text("18/11/2024")
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(Color(red: 0.2, green: 0.74, blue: 0.17))
                
            }
            HStack(spacing: 8) {
                Text("18/11/2025")
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundStyle(Color(red: 1, green: 0.72, blue: 0.29))
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}

struct AddVacinaView: View {
    @State var birthdate = Date()
    var body: some View {
        VStack {
            HStack {
                Text("Salvar")
                    .foregroundStyle(.white)
                Spacer()
                Text("Adicionar vacina")
                    .font(.system(size: 17, weight: .semibold))
                Spacer()
                Text("Salvar")
                    .font(.system(size: 17, weight: .semibold))
                
            }
            .padding()
            
            Spacer()
            
            VStack {
                HStack {
                    DatePicker("\(birthdate.formatted(date: .long, time: .omitted))", selection: $birthdate, in: ...Date(), displayedComponents: .date)
                        .labelsHidden()
                        .padding()
                    
                    Spacer()
                    
                    Image(systemName: "calendar")
                        .padding(.horizontal)
                        .foregroundStyle(Color(red: 0.75, green: 0.49, blue: 0))
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 22)
                        .stroke(Color(red: 1, green: 0.91, blue: 0.49), lineWidth: 1.5)
                }
            }
            .padding(.horizontal, 40)
            Spacer()
        }
    }
}

#Preview {
    AddVacinaView()
}
