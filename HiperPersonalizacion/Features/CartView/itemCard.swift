//
//  itemCard.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//
import SwiftUI

struct ItemCardView: View {
    
    let config: ResponseConfig
    let title: String
    let subtitle: String
    let priceText: String
    let imageName: String
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 14) {
                
                RoundedRectangle(cornerRadius: config.border)
                    .fill(Color.white)
                    .overlay(
                        AsyncImage(url: URL(string: imageName)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .padding(10)
                            case .failure:
                                Image(systemName: "shippingbox.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(18)
                                    .foregroundColor(.gray.opacity(0.8))
                            @unknown default:
                                EmptyView()
                            }
                        }
                    )
                    .frame(width: 86, height: 86)
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text(title)
                    

                        .font(config.fuente.toSwiftUIFont(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.9))
                        .lineLimit(2)
                    
                    Text(subtitle)
                        .font(config.fuente.toSwiftUIFont(size: 12))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Text(priceText)
                            .font(config.fuente.toSwiftUIFont(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: config.button))
                            .padding(.horizontal, 18)
                            .padding(.vertical, 9)
                            .background(
                                Capsule()
                                    .fill(Color.white)
                            )
                            .overlay(
                                Capsule()
                                    .stroke(Color(hex: config.button), lineWidth: 1.5)
                            )
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            Text("1")
                                .font(config.fuente.toSwiftUIFont(size: 13))
                                .fontWeight(.medium)

                            
                            Image(systemName: "chevron.down")
                                .font(.system(size: 10, weight: .bold))
                        }
                        .foregroundColor(.gray)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(Color.gray.opacity(0.12))
                        )
                        
                        Image(systemName: "trash")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                            .padding(8)
                            .background(
                                Circle()
                                    .fill(Color.gray.opacity(0.12))
                            )
                    }
                    .padding(.top, 12)
                }
                Spacer()
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: config.border)
                .fill(Color(hex: config.bg_bottom))
        )
        .shadow(color: Color.black.opacity(0.10), radius: 18, x: 0, y: 8)
    }
}

#Preview {
    ItemCardView(
        config: .preview,
        title: "Smart Watch WH22–6 Fitness...",
        subtitle: "44mm / Gray",
        priceText: "$450.00",
        imageName: "https://picsum.photos/200"
    )
    .padding()
    .background(Color.gray.opacity(0.1))
}
