//
//  HiperPersonalizacionApp.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//

import SwiftUI
import FirebaseCore

@main
struct HiperPersonalizacionApp: App {
    
    @StateObject private var designVM = DesignTokensViewModel(
          tokenProvider: FirebaseTokenProvider()
      )
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                Home()
                    .environmentObject(designVM)
            }
           
        }
    }
}


#Preview {
    NavigationStack {
        Home()
            .environmentObject(
                DesignTokensViewModel(tokenProvider: FirebaseTokenProvider())
            )
    }
}
