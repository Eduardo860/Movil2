//
//  TokenProvider.swift
//  HiperPersonalizacion
//
//  Created by Eduardo Pérez Córdova on 18/11/25.
//
protocol TokenProvider {
    func fetchDesignTokens(completion: @escaping (ResponseConfig) -> Void)
}
