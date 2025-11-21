//
//  menuNavigator.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//

import SwiftUI

struct menuNavigator: View {
    let home: Bool
    var body: some View {
        HStack(spacing: 26) {
            if home {
                ZStack {
                    HStack {
                        bottomIcon(system: "house.fill", active: true, title: "Home")
                    }
                }
            }
            else {
                bottomIcon(system: "house.fill", active: false, title: nil)
            }
            bottomIcon(system: "heart.fill", active: false, title: nil)
            bottomIcon(system: "shippingbox.fill", active: false, title: nil)
            
            if home == false {
                ZStack {
                    bottomIcon(system: "basket", active: true, title: "Cart")
                    
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
                            .offset(x: -45, y: 0)
                        }
                        Spacer()
                    }
                }
            }
            else {
                ZStack {
                    bottomIcon(system: "basket", active: false, title: nil)
                    
                    VStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color(red: 1.0, green: 104/255, blue: 57/255))
                                    .frame(width: 18, height: 18)
                                Text("4")
                                    .font(.system(size: 11, weight: .bold))
                                    .foregroundColor(.white)
                            }
                            .offset(x: 10, y: 3)
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
                .shadow(color: Color.black.opacity(0.18), radius: 12, x: 0, y: 6)
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
                            .fill(Color(red: 129/255, green: 104/255, blue: 255/255))
                            .frame(width: 120, height: 50)
                    } else {
                        Capsule().fill(Color.clear)
                    }
                }
            )
        }
}

#Preview {
    menuNavigator(home: false)
    .padding()
    .background(Color.gray.opacity(0.1))
}
