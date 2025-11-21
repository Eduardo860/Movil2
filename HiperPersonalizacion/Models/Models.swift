//
//  Models.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//
import Foundation

struct DesignToken: Codable {
    let name: String
    let values: [Value]
}


struct Value: Codable {
    let color: [Colors]?
    let mode: Mode
    let number, string: [Colors]?
}

struct Colors: Codable {
    let value, colorVar, name, rootAlias: String

    enum CodingKeys: String, CodingKey {
        case value
        case colorVar = "var"
        case name, rootAlias
    }
}


struct Mode: Codable {
    let id, name: String
}

typealias DesignTokens = [DesignToken]
