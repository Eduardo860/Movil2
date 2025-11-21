//
//  UserAdapter.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//

import SwiftUI

enum UserAdapter {
    
    static func convert(data: DesignTokens) -> ResponseConfig {
        
        // 1. Grupos principales
        let colorGroup        = data.first(where: { $0.name == "Color" })
        let typoGroup         = data.first(where: { $0.name == "Tipografía" })
        let translationGroup  = data.first(where: { $0.name == "Traducción" })
        let numbersGroup      = data.first(where: { $0.name == "Numbers" })
        let textGroup         = data.first(where: { $0.name == "Text" })
        
        // 2. Modos
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
        
        let textMode = textGroup?.values.first(where: { $0.mode.name == "light" })
                     ?? textGroup?.values.first
        
        // 3. Helpers
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
        
        // 4. Colores
        let bgBody    = value(in: lightMode?.color, named: "bg_body",   default: "#FFFFFF")
        let bgBottom  = value(in: lightMode?.color, named: "bg_bottom", default: "#FFFFFF")
        let button    = value(in: lightMode?.color, named: "button",    default: "#000000")
        
        // 5. Traducciones
        let biometricos = value(in: spanishMode?.string, named: "Biométricos", default: "Biométricos")
        let contrasena  = value(in: spanishMode?.string, named: "Contraseña",  default: "Contraseña")
        let ingresar    = value(in: spanishMode?.string, named: "Ingresar",    default: "Ingresar")
        
        // 6. Tipografía
        let fuente = value(
            in: xlMode?.string,
            named: "font/family/title",
            default: "System"
        )
        
        // 7. Números
        let borderPx       = value(in: largeNumbers?.number, named: "Cards", default: "0px")
        let borderSmallPx  = value(in: smallNumbers?.number, named: "Cards", default: "0px")
        
        // 8. Texto general (MLC)
        let headerTitle = value(in: textMode?.string, named: "Alert", default: "MLC")   
        
        let themeName = lightMode?.mode.name ?? "Default"
        
        // 9. Construcción del ResponseConfig COMPLETO
        return ResponseConfig(
            name: themeName,
            bg_body: bgBody,
            bg_bottom: bgBottom,
            button: button,
            biometricos: biometricos,
            contrasena: contrasena,
            ingresar: ingresar,
            fuente: fuente,
            border: px(borderPx),
            border_small: px(borderSmallPx),
            tema: themeName,
            header_title: headerTitle
        )
    }
}
