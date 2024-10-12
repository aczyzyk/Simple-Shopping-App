//
//  CurrenciesServiceProtocol.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

protocol CurrenciesServiceProtocol {
    var currenciesPublisher: Published<[Currency]>.Publisher { get }
    func convert(_ amount: Double, to currency: Currency) -> Double
}
