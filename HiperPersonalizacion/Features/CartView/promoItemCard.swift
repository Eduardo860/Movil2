//
//  promoItemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct promoItemCard: View {
    var body: some View {
        HStack(spacing: 12) {
            Text("Enter promocode")
                .font(.system(size: 15))
                .foregroundColor(.gray)
                .padding(.leading, 30)
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(red: 129/255, green: 104/255, blue: 255/255))
                .overlay(
                    Text("Apply Code")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                )
                .frame(width: 135, height: 60)
                .padding(.trailing, 5)
        }
        .frame(height: 70)
        .background(Color.white)
        .cornerRadius(25)
    }
}

#Preview {
    promoItemCard()
    .padding()
    .background(Color.gray.opacity(0.1))
}
