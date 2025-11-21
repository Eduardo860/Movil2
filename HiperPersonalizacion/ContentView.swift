//
//  ContentView.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = DesignTokensViewModel(
        tokenProvider: FirebaseTokenProvider()
    )
    
    var body: some View {
        Group {
            if let config = viewModel.config {
                ZStack {
                    Color(hex: config.bg_body)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 16) {
                        Text(config.tema)
                            .font(config.fuente.toSwiftUIFont(size: 24))
                            .padding()
                        
                        Text(config.biometricos)
                            .font(config.fuente.toSwiftUIFont(size: 18))
                        
                        SecureField(config.contrasena, text: .constant(""))
                            .padding()
                            .background(Color(hex: config.bg_bottom))
                            .cornerRadius(config.border)
                            .padding(.horizontal, 32)
                        
                        Button {
                            // acción dummy
                        } label: {
                            Text(config.ingresar)
                                .font(config.fuente.toSwiftUIFont(size: 18))
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color(hex: config.button))
                        .foregroundColor(.white)
                        .cornerRadius(config.border_small)
                        .padding(.horizontal, 32)
                    }
                }
            } else {
                ProgressView("Cargando diseño desde Firebase...")
            }
        }
    }
}

#Preview {
    ContentView()
}
