//
//  ViewModel.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//

import SwiftUI
import Combine

class DesignTokensViewModel: ObservableObject {
    @Published var tokens: DesignTokens? = nil  
    @Published var config: ResponseConfig? = nil
    private var tokenProvider: TokenProvider
    
    init(tokenProvider: TokenProvider) {
        self.tokenProvider = tokenProvider
        fetchTokens()
    }
    
    func fetchTokens() {
        tokenProvider.fetchDesignTokens { [weak self] config in
            self?.config = config
        }
    }
}

