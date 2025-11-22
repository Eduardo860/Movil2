//
//  promoItemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct promoItemCard: View {
    let config: ResponseConfig
    var body: some View {
        HStack(spacing: 12) {
            Text("Enter promocode")
                .font(config.fuente.toSwiftUIFont(size: 15))
                .foregroundColor(.gray)
                .padding(.leading, 30)
            Spacer()
            
            RoundedRectangle(cornerRadius: config.border)
                .fill(Color(hex:config.button))
                .overlay(
                    Text("Apply Code")
                        .font(config.fuente.toSwiftUIFont(size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                )
                .frame(width: 135, height: 60)
                .padding(.trailing, 5)
        }
        .frame(height: 70)
        .background(Color(hex: config.bg_bottom))
        .cornerRadius(config.border)
    }
}

#Preview {
    promoItemCard(config: .preview)
    .padding()
    .background(Color.gray.opacity(0.1))
}
