//
//  totalItemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//

import SwiftUI

struct totalItemCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Total:")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("$878.71")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
            }
            
            HStack {
                Text("Subtotal:")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Spacer()
                Text("$828.97")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Fees:")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Spacer()
                Text("$49.74")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }
                        
            HStack {
                Text("Delivery Options")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text("Standard (Free)")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                Image(systemName: "chevron.down")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.gray)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    Color.white
                )
        )
    }
}

#Preview {
    totalItemCard()
    .padding()
    .background(Color.gray.opacity(0.1))
}
