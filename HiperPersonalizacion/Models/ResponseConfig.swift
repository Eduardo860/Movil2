//
//  ResponseConfig.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//
import Foundation

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
}

