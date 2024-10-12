//
//  MockConversionRatesService.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

actor MockConversionRatesService: ConversionRatesServiceProtocol {
    
    func getCurrentRates() async throws -> ConversionRatesTable {
        guard let url = Bundle.main.url(forResource: "conversion_rates", withExtension: "json") else { throw URLError(.badURL) }
        let data = try Data(contentsOf: url)
#if DEBUG
        try await Task.sleep(nanoseconds: 2_000_000_000)
#endif
        return try JSONDecoder().decode(ConversionRatesTable.self, from: data)
    }
    
}
