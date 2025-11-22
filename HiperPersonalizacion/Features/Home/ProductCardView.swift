//  ProductCardView.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 20/11/25.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product
    let config: ResponseConfig
    
    private let cardHeight: CGFloat       = 300
    private let imageAreaHeight: CGFloat  = 120
    private let frontCardHeight: CGFloat  = 140
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .bottom) {
                
                RoundedRectangle(cornerRadius: config.border)
                    .fill(Color(hex: config.bg_bottom).opacity(0.75))
                    .shadow(color: Color.black.opacity(0.06),
                            radius: 10, x: 0, y: 8)
                    .frame(height: cardHeight)

                VStack(spacing: 0) {
                    
                    if let url = URL(string: product.imageName),
                       product.imageName.contains("http") {

                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: imageAreaHeight)
                                    .frame(maxWidth: .infinity)
                                    .padding(.top, 10)

                            case .failure(_):
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: imageAreaHeight)
                                    .frame(maxWidth: .infinity)
                                    .padding(.top, 10)
                                    .foregroundColor(.gray)

                            case .empty:
                                ProgressView()
                                    .frame(height: imageAreaHeight)

                            @unknown default:
                                EmptyView()
                            }
                        }

                    } else {
                        
                        Image(systemName: product.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: imageAreaHeight)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 10)
                            .foregroundColor(.gray)
                    }
                    

                    Spacer()
                }

                
                VStack(spacing: 10) {
                    VStack(spacing: 2) {
                        Text(product.name)
                            .font(config.fuente.toSwiftUIFont(size: 13))
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)

                        Text(product.subtitle)
                            .font(config.fuente.toSwiftUIFont(size: 11))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .lineLimit(1)
                    }

                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: config.border_small)
                            .stroke(Color(hex: config.button), lineWidth: 1.5)
                            .frame(height: 34)
                            .overlay(
                                Group {
                                    if product.price.lowercased() == "in cart" {
                                        Text(product.price)
                                            .font(config.fuente.toSwiftUIFont(size: 14))
                                            .foregroundColor(Color(hex: config.button))
                                    } else {
                                        HStack(spacing: 6) {
                                            Image(systemName: "basket.fill")
                                                .font(.system(size: 13, weight: .semibold))
                                            Text(product.price)
                                                .font(config.fuente.toSwiftUIFont(size: 14))
                                        }
                                        .foregroundColor(Color(hex: config.button))
                                    }
                                }
                            )
                    }
                    .padding(.top, 4)
                }
                .frame(height: frontCardHeight)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 14)
                .background(
                    RoundedRectangle(cornerRadius: config.border)
                        .fill(Color.white)
                )
                .padding(.horizontal, 8)
                .padding(.bottom, 8)
            }
            
            .overlay(
                Group {
                    if product.isTop {
                        Text("Top item")
                            .font(config.fuente.toSwiftUIFont(size: 11))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                Capsule().fill(Color.yellow)
                            )
                            .shadow(color: Color.black.opacity(0.1),
                                    radius: 4, x: 0, y: 2)
                            .offset(y: -(frontCardHeight / 1.2) - 10)
                    }
                },
                alignment: .bottom
            )
            Button {
            } label: {
                Image(systemName: product.isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(hex: config.button))
                    .padding(10)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.12),
                            radius: 8, x: 0, y: 4)
            }
            .padding(10)
        }
        .frame(height: cardHeight)
        .padding(4)
    }
}


#Preview {
   
    let product = Product(
        name: "Smart Watch WH22-6",
        subtitle: "Fitness Tracker",
        price: "In cart",
        isTop: true,
        imageName: "applewatch",
        isLiked: true
    )
    
    return ProductCardView(product: product, config: .preview)
        .padding()
        .background(Color(hex: "#F6F7FB"))
}
