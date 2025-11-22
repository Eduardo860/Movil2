//
//  menuNavigator.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//

import SwiftUI


struct MenuNavigator: View {
    let config: ResponseConfig
    let home: Bool
    @EnvironmentObject var tokensVM: DesignTokensViewModel
    
    var body: some View {
        HStack(spacing: 26) {
            
            // --- HOME ---
            if home {
                activeIcon(system: "house.fill", title: "Home")
            } else {
                NavigationLink {
                    Home()
                        .environmentObject(tokensVM)
                } label: {
                    inactiveIcon(system: "house.fill")
                }
            }
            
            // --- Otros botones sin navegación ---
            inactiveIcon(system: "heart.fill")
            inactiveIcon(system: "shippingbox.fill")
            
            // --- CART ---
            NavigationLink {
                CartDribbbleView(config: config)
                    .environmentObject(tokensVM)
            } label: {
                ZStack(alignment: .topTrailing) {
                    
                    if home {
                        inactiveIcon(system: "basket")
                    } else {
                        activeIcon(system: "basket", title: "Cart")
                    }
                    
                    // Badge
                    Circle()
                        .fill(Color(red: 1, green: 104/255, blue: 57/255))
                        .frame(width: 18, height: 18)
                        .overlay(
                            Text("4")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundColor(.white)
                        )
                        .offset(x: 6, y: -6)
                }
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: config.border)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.18), radius: 12, x: 0, y: 0)
        )
        .padding(.horizontal, 32)
        .frame(height: 60)
    }
}

// MARK: - Ícono Activo (con texto + capsule)
private extension MenuNavigator {
    func activeIcon(system: String, title: String) -> some View {
        HStack(spacing: 6) {
            Image(systemName: system)
                .font(config.fuente.toSwiftUIFont(size: 18))
            
            Text(title)
                .font(config.fuente.toSwiftUIFont(size: 14))
        }
        .foregroundColor(.white)
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .fill(Color(hex: config.button))
        )
    }
}

// MARK: - Ícono Inactivo (solo el ícono)
private extension MenuNavigator {
    func inactiveIcon(system: String) -> some View {
        Image(systemName: system)
            .font(config.fuente.toSwiftUIFont(size: 18))
            .foregroundColor(.gray)
            .padding(.vertical, 8)
    }
}

// MARK: - PREVIEW

#Preview {
    MenuNavigator(config: .preview, home: false)
        .padding()
        .background(Color.gray.opacity(0.1))
}
