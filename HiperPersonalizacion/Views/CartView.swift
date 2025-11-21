//
//  CartView.swift
//  HiperPersonalizacion
//
//  Created by Diego Rodrigo Hernandez Castlazzo on 20/11/25.
//

import SwiftUI

struct CartDribbbleView: View {
    let config: ResponseConfig
    
    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Text("Cart")
                        .font(config.fuente.toSwiftUIFont(size: 24))
                        .padding(.top, 15)
                        .padding(.leading, 70)
                    Spacer()
                    AsyncImage(url: URL(string: "https://static.vecteezy.com/system/resources/previews/024/032/417/non_2x/chinese-young-guy-student-with-glasses-smiling-generative-ai-photo.jpg")) { phase in
                        switch phase {
                        case .empty:
                            // Mientras carga
                            ProgressView()
                                .frame(width: 56, height: 56)
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                                )
                            
                        case .failure(_):
                            // Si falla, un placeholder
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .foregroundColor(.white)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white.opacity(0.5), lineWidth: 2)
                                )
                            
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .padding(.trailing, 18)
                    .padding(.top, 20)
                }
                ItemCardView(
                    config: config,
                    title: "Smartwatch",
                    subtitle: "44mm Gray",
                    priceText: "$450.00",
                    imageName: "https://e7.pngegg.com/pngimages/406/744/png-clipart-apple-watch-series-3-apple-watch-series-1-smartwatch-apple-gadget-electronics.png"
                )
                .padding(.top, 20)
                .padding(.horizontal, 10)
                
                removeItemCard(config: config)
                    .padding(.top, 1)
                
                    .padding(.horizontal, 10)
                ItemCardView(
                    config: config,
                    title: "Premium Boxing Gloves for Sp...",
                    subtitle: "12oz / White",
                    priceText: "$196.99",
                    imageName: "https://png.pngtree.com/png-clipart/20231102/original/pngtree-white-boxing-gloves-two-photo-png-image_13490246.png"
                )
                .padding(.top, 1)
                .padding(.horizontal, 10)
                
                promoItemCard(config: config)
                    .padding(.horizontal, 10)
                
                totalItemCard()
                    .padding(.horizontal, 10)
                
                checkoutItemButton(config: config)
                
                Spacer()
                
                menuNavigator(config:config,home:false)
                    .padding()
                
                Spacer()
            }
            .background(Color(hex:config.bg_body))
        }
}


#Preview {
    CartPreviewWrapper()
        .environmentObject(
            DesignTokensViewModel(tokenProvider: FirebaseTokenProvider())
        )
}

private struct CartPreviewWrapper: View {
    @EnvironmentObject var tokensVM: DesignTokensViewModel
    
    var body: some View {
        Group {
            if let config = tokensVM.config {
                CartDribbbleView(config: config)
            } else {
                ProgressView("Cargando tokens de Firebase...")
            }
        }
    }
}
