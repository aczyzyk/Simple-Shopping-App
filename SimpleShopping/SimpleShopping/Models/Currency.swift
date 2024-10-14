//
//  Currency.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

struct Currency: Identifiable, Hashable {
    let id = UUID()
    let symbol: String
    let rate: Double
}

extension Currency {
    static let baseCurrency = Currency(symbol: "USD", rate: 1.0)
}
