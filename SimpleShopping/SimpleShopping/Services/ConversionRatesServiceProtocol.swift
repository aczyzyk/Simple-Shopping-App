//
//  ConversionRatesServiceProtocol.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

protocol ConversionRatesServiceProtocol {
    func getCurrentRates() async throws -> ConversionRatesTable
}
