//
//  Home.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 20/11/25.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var tokensVM: DesignTokensViewModel
    
    @State private var selectedCategory: String = "Sport"
    
    
    private let categories = ["Wellness", "Art", "Sport", "Home", "Music"]
    
    private let products: [Product] = [
        Product(name: "Smart Watch WH22-6",
                subtitle: "Fitness Tracker",
                price: "In cart",
                isTop: true,
                imageName: "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MXM23ref_FV99_VW_34FR+watch-case-46-titanium-slate-cell-s11_VW_34FR+watch-face-46-titanium-slate-s11_VW_34FR_GEO_MX?wid=2000&hei=2000&fmt=png-alpha&.v=TnVrdDZWRlZzTURKbHFqOGh0dGpVRW5TeWJ6QW43NUFnQ2V4cmRFc1VnWTc4blplVGNpSEZpNjZUNjVaN2NmQ3RJRTVDMHMyN1FVbEVmSUZqNGJHdnZmQXlUU2xCQ2pTN3lrcDE0UU1hK0VYZWthQXJCL2NtQ1RrVVMvZXZWQVlmZk9nL2NRSG9kM0xGNis5SVNCUEExNGxjSGpqblBHdjdHb0ZZbHYvVFZtLzRpa1dhcXBneVhtUk15MGZlY0FDK3BnT2ZXblNnWDBEYWFZb2JVeDdORDdBMjdrMmZzZW05c1crdHA4ZC92Yw",
                isLiked: true),

        Product(name: "Club Kit 1 Recurve",
                subtitle: "Archery Set",
                price: "$48.99",
                isTop: false,
                imageName: "https://w7.pngwing.com/pngs/447/640/png-transparent-bow-and-arrow-ranged-weapon-archery-recurve-bow-arrow-color-bow-weapon.png",
                isLiked: false),

        Product(name: "Nike Air Vapormax Plus",
                subtitle: "Light Blue 924453-402",
                price: "$154.97",
                isTop: false,
                imageName: "https://static.nike.com/a/images/t_web_pw_592_v2/f_auto/9a7bea5c-c1d9-42c7-8e3a-5996716ee4e4/AIR+MAX+DN8+SE.png",
                isLiked: false),

        Product(name: "Pullover Hoodie – Hoodie",
                subtitle: "Unisex Casual",
                price: "In cart",
                isTop: true,
                imageName: "https://gride.com.mx/cdn/shop/files/hoodie_Custom_View_1.png?v=1748970050",
                isLiked: true)
    ]

    
    private let columns = [
        GridItem(.flexible(), spacing: 4),//Horizontal Cartas
        GridItem(.flexible(), spacing: 4)
    ]
    
    var body: some View {
        Group {
            if let config = tokensVM.config {
                content(config: config)
            } else {
                ZStack {
                    Color(.systemGroupedBackground)
                        .ignoresSafeArea()
                    ProgressView("Cargando diseño...")
                }
            }
        }
    }
    
    // MARK: - Contenido usando ResponseConfig
    
    private func content(config: ResponseConfig) -> some View {
        ZStack {
            Color(hex: config.bg_body)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    header(config: config)
                    categoryChips(config: config)
                    productGrid(config: config)
                }
                .padding(.bottom, 24)
                
                
            }
            VStack {
                Spacer()
                       menuNavigator(config: config, home: true)
                           .padding(.bottom, 10)
            }
        }
    }
    
    // MARK: - Subviews
    
    private func header(config: ResponseConfig) -> some View {
        ZStack {
            Text("MLC")
                .font(config.fuente.toSwiftUIFont(size: 26))
                .kerning(4)
            
            HStack {
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 34, height: 34)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
    
    private func categoryChips(config: ResponseConfig) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .font(config.fuente.toSwiftUIFont(size: 14))
                        .padding(.horizontal, 18)
                        .padding(.vertical, 8)
                        .background(
                            Capsule()
                                .fill(
                                    category == selectedCategory
                                    ? Color(hex: config.button)
                                    : Color(hex: config.bg_bottom)
                                )
                        )
                        .overlay(
                            Capsule()
                                .stroke(
                                    category == selectedCategory
                                    ? Color.clear
                                    : Color.gray.opacity(0.25),
                                    lineWidth: 1
                                )
                        )
                        .foregroundColor(
                            category == selectedCategory
                            ? .white
                            : .black.opacity(0.7)
                        )
                        .shadow(
                            color: category == selectedCategory
                                ? Color.black.opacity(0.15)
                                : .clear,
                            radius: 8, x: 0, y: 6
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    private func productGrid(config: ResponseConfig) -> some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(products) { product in
                ProductCardView(product: product, config: config)
            }
        }
        .padding(.horizontal,12)
        
        
    }
}

#Preview {
    Home()
        .environmentObject(
            DesignTokensViewModel(tokenProvider: FirebaseTokenProvider())
        )
}
