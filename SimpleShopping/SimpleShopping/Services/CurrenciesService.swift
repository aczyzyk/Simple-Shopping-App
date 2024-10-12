//
//  CurrenciesService.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

class CurrenciesService: CurrenciesServiceProtocol {
        
    private let conversionRatesService: ConversionRatesServiceProtocol
    
    var currenciesPublisher: Published<[Currency]>.Publisher { $currencies }
    @Published var currencies: [Currency] = []
    
    init(conversionRatesService: ConversionRatesServiceProtocol) {
        self.conversionRatesService = conversionRatesService
        loadConversionRates()
    }
    
    func convert(_ amount: Double, to currency: Currency) -> Double {
        amount * currency.rate
    }
    
    private func loadConversionRates() {
        Task {
            let currentRates = try await conversionRatesService.getCurrentRates()
            await MainActor.run {
                currencies = currentRates.currencies
            }
        }
    }
    
}
