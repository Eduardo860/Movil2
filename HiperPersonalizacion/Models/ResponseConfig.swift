//
//  ResponseConfig.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//
import SwiftUI

enum APIDataSource {
    case firebase(DesignToken)
}

struct ResponseConfig: Codable {
    let name: String
    let bg_body: String
    let bg_bottom: String
    let button : String
    let biometricos : String
    let contrasena: String
    let ingresar: String
    let fuente: String
    let border: CGFloat
    let border_small: CGFloat
    let tema: String
    let header_title: String
}


extension ResponseConfig {
    static let preview: ResponseConfig = ResponseConfig(
        name: "Preview",
        bg_body: "#F6F7FB",
        bg_bottom: "#EEEEEE",
        button: "#5C3BEE",
        biometricos: "Biométricos",
        contrasena: "Contraseña",
        ingresar: "Ingresar",
        fuente: "HelveticaNeue",
        border: 20,
        border_small: 16,
        tema: "Light",
        header_title: "MLC"
    )
}
