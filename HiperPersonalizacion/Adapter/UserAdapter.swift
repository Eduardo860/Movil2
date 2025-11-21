//
//  UserAdapter.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//

import SwiftUI

enum UserAdapter {
    
    static func convert(data: DesignTokens) -> ResponseConfig {
        
        // 1. Grupos principales según tu JSON
        let colorGroup        = data.first(where: { $0.name == "Color" })
        let typoGroup         = data.first(where: { $0.name == "Tipografía" })
        let translationGroup  = data.first(where: { $0.name == "Traducción" })
        let numbersGroup      = data.first(where: { $0.name == "Numbers" })
        
        // 2. Modos que vamos a usar (puedes cambiar la lógica luego)
        let lightMode   = colorGroup?.values.first(where: { $0.mode.name == "Lightmode" })
                        ?? colorGroup?.values.first
        
        let xlMode      = typoGroup?.values.first(where: { $0.mode.name == "XL" })
                        ?? typoGroup?.values.first
        
        let spanishMode = translationGroup?.values.first(where: { $0.mode.name == "Español" })
                        ?? translationGroup?.values.first
        
        let largeNumbers = numbersGroup?.values.first(where: { $0.mode.name == "Large" })
                         ?? numbersGroup?.values.first
        
        let smallNumbers = numbersGroup?.values.first(where: { $0.mode.name == "Small" })
                         ?? numbersGroup?.values.last
        
        // 3. Helpers para buscar valores dentro de [Colors]
        func value(in items: [Colors]?, named name: String, default def: String = "") -> String {
            items?.first(where: { $0.name == name })?.value ?? def
        }
        
        func px(_ string: String?, default def: CGFloat = 0) -> CGFloat {
            guard let s = string?
                .replacingOccurrences(of: "px", with: "")
                .trimmingCharacters(in: .whitespaces)
            else { return def }
            
            return CGFloat(Double(s) ?? Double(def))
        }
        
        // 4. Colores (grupo "Color" / modo "Lightmode")
        let bgBody    = value(in: lightMode?.color, named: "bg_body",   default: "#FFFFFF")
        let bgBottom  = value(in: lightMode?.color, named: "bg_bottom", default: "#FFFFFF")
        let button    = value(in: lightMode?.color, named: "button",    default: "#000000")
        
        // 5. Traducciones (grupo "Traducción" / modo "Español")
        let biometricos = value(in: spanishMode?.string, named: "Biométricos", default: "Biométricos")
        let contrasena  = value(in: spanishMode?.string, named: "Contraseña",  default: "Contraseña")
        let ingresar    = value(in: spanishMode?.string, named: "Ingresar",    default: "Ingresar")
        
        // 6. Tipografía (grupo "Tipografía" / modo "XL")
        let fuente = value(
            in: xlMode?.string,
            named: "font/family/title",
            default: "System"
        )
        
        // 7. Números (grupo "Numbers" → Large/Small)
        let borderPx       = value(in: largeNumbers?.number, named: "Cards", default: "0px")
        let borderSmallPx  = value(in: smallNumbers?.number, named: "Cards", default: "0px")
        
        // 8. Armar el ResponseConfig final
        let themeName = lightMode?.mode.name ?? "Default"
        
        return ResponseConfig(
            name: themeName,            // nombre "Lightmode"
            bg_body: bgBody,            // "#000000" / "#00c7fc" según el JSON
            bg_bottom: bgBottom,        // "#ffffff" / "#94e3fe"
            button: button,             // "#919191" u otro
            biometricos: biometricos,   // "Biométricos"
            contrasena: contrasena,     // "Contraseña"
            ingresar: ingresar,         // "Entrar"
            fuente: fuente,             // "Roboto"
            border: px(borderPx),       // "20px" → 20.0
            border_small: px(borderSmallPx), // "8px" → 8.0
            tema: themeName             // lo mismo que name, por ahora
        )
    }
}
