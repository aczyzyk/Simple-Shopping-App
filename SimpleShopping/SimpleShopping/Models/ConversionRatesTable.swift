//
//  ConversionRatesTable.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

struct ConversionRatesTable: Codable {
    let success: Bool
    let timestamp: Int
    let source: String
    let quotes: [String:Double]
}

extension ConversionRatesTable {
    var currencies: [Currency] {
        quotes
            .filter { $0.key.count == 6 }
            .map { Currency(symbol: String($0.key.suffix(3)),
                                  rate: $0.value) }
    }
}
