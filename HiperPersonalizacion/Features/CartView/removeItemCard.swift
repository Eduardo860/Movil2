//
//  removeItemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct removeItemCard: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Spacer()
                Image(systemName: "trash")
                    .font(.system(size: 16))
                Text("Remove Item")
                    .font(.system(size: 14, weight: .semibold))
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
            .font(.system(size: 14, weight: .semibold))
            .frame(maxWidth: 90)
            .padding(.vertical, 12)
            .background(
                Capsule()
                    .fill(filled ? Color(red: 129/255, green: 104/255, blue: 255/255) : Color.clear)
            )
            .overlay(
                Capsule()
                    .stroke(Color(red: 129/255, green: 104/255, blue: 255/255), lineWidth: filled ? 0 : 1)
            )
            .foregroundColor(filled ? .white : Color(red: 129/255, green: 104/255, blue: 255/255))
    }
}

#Preview {
    removeItemCard()
    .padding()
    .background(Color.gray.opacity(0.1))
}
