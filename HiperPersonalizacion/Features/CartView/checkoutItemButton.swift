//
//  checkoutItemButton.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct checkoutItemButton: View {
    var body: some View {
        HStack {
            Image(systemName: "basket")
                .font(.system(size: 16, weight: .semibold))
            Text("$878.71")
                .font(.system(size: 17, weight: .bold))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 23)
        .background(
            Capsule()
                .fill(Color(red: 129/255, green: 104/255, blue: 255/255))
        )
        .padding(.horizontal, 10)
        .padding(.top, 8)
    }
}

#Preview {
    checkoutItemButton()
    .padding()
    .background(Color.gray.opacity(0.1))
}
