//
//  menuNavigator.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct menuNavigator: View {
    let config: ResponseConfig
    let home: Bool
    
    var body: some View {
        HStack(spacing: 26) {
            
         
            if home {
                
                bottomIcon(system: "house.fill", active: true, title: "Home")
            } else {
                NavigationLink {
                    Home()
                } label: {
                    bottomIcon(system: "house.fill", active: false, title: nil)
                }
            }

            // Otros botones (sin navegación)
            bottomIcon(system: "heart.fill", active: false, title: nil)
            bottomIcon(system: "shippingbox.fill", active: false, title: nil)

            NavigationLink {
                CartDribbbleView(config: config)
            } label: {
                ZStack {
                    bottomIcon(system: "basket", active: !home, title: home ? nil : "Cart")

                    VStack {
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(Color(red: 1.0, green: 104/255, blue: 57/255))
                                    .frame(width: 18, height: 18)
                                Text("4")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .offset(x: home ? 10 : -45)
                        }
                        Spacer()
                    }
                }
            }

        }
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 28)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.18),
                        radius: 12, x: 0, y: 6)
        )
        .padding(.horizontal, 32)
        .frame(height: 50)
    }

    private func bottomIcon(system: String, active: Bool, title: String?) -> some View {
        HStack(spacing: 6) {
            Image(systemName: system)
                .font(.system(size: 18, weight: .semibold))

            if let title = title {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
            }
        }
        .padding(.horizontal, title == nil ? 0 : 10)
        .padding(.vertical, 8)
        .foregroundColor(active ? .white : .gray)
        .background(
            Group {
                if active {
                    Capsule()
                        .fill(Color(hex: config.button))
                        .frame(width: 120, height: 50)
                } else {
                    Capsule().fill(Color.clear)
                }
            }
        )
    }
}

#Preview {
    menuNavigator(config: .preview, home: false)
        .padding()
        .background(Color.gray.opacity(0.1))
}
