//
//  totalItemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//

import SwiftUI

struct totalItemCard: View {
    let config: ResponseConfig

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Total:")
                    .font(config.fuente.toSwiftUIFont(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
                Text("$878.71")
                    .font(config.fuente.toSwiftUIFont(size: 17))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            
            HStack {
                Text("Subtotal:")
                    .font(config.fuente.toSwiftUIFont(size: 13))
                    .foregroundColor(.gray)
                Spacer()
                Text("$828.97")
                    .font(config.fuente.toSwiftUIFont(size: 13))
                    .foregroundColor(.gray)
            }
            
            HStack {
                Text("Fees:")
                    .font(config.fuente.toSwiftUIFont(size: 13))
                    .foregroundColor(.gray)
                Spacer()
                Text("$49.74")
                    .font(config.fuente.toSwiftUIFont(size: 13))
                    .foregroundColor(.gray)
            }
                        
            HStack {
                Text("Delivery Options")
                    .font(config.fuente.toSwiftUIFont(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Spacer()
                Text("Standard (Free)")
                    .font(config.fuente.toSwiftUIFont(size: 13))
                    .foregroundColor(.gray)
                Image(systemName: "chevron.down")
                    .font(config.fuente.toSwiftUIFont(size: 11))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: config.border)
                .fill(
                    Color.white
                )
        )
    }
}

#Preview {
    totalItemCard(config: .preview)
    .padding()
    .background(Color.gray.opacity(0.1))
}
