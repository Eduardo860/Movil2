//
//  removeItemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct removeItemCard: View {
    let config: ResponseConfig
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Image(systemName: "trash")
                    .font(config.fuente.toSwiftUIFont(size: 16))
                Text("Remove Item")
                    .font(config.fuente.toSwiftUIFont(size: 14))
                    .fontWeight(.semibold)
                Spacer()
            }
            .foregroundColor(.black.opacity(0.9))
            
            HStack(spacing: 12) {
                Spacer()
                pillChoice(text: "No", filled: false)
                pillChoice(text: "Yes", filled: true)
                Spacer()
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    Color.white
                )
        )
        
    }
    
    func pillChoice(text: String, filled: Bool) -> some View {
        Text(text)
            .font(config.fuente.toSwiftUIFont(size: 14))
            .fontWeight(.semibold)
            .frame(maxWidth: 90)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(filled ? Color(hex:config.button) : Color.clear)
            )
            .overlay(
                Capsule()
                    .stroke(Color(hex:config.button), lineWidth: filled ? 0 : 1)
            )
            .foregroundColor(filled ? .white : Color(hex: config.button))
    }
}

#Preview {
    removeItemCard(config: .preview)
    .padding()
    .background(Color.gray.opacity(0.1))
}
