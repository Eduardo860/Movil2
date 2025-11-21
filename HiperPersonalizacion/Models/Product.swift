//
//  Product.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 20/11/25.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let price: String
    let isTop: Bool
    let imageName: String
}
