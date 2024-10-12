//
//  BasketViewModel.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation
import Combine

class BasketViewModel: ObservableObject {
    
    private let currenciesService: CurrenciesServiceProtocol
    
    @Published var items: [BasketItem] = []
    @Published var availableCurrencies: [Currency] = []
    @Published var selectedCurrency: Currency = Currency(symbol: "USD", rate: 1.0)
    
    private var subscribers = Set<AnyCancellable>()
    
    var totalValue: Double {
        items.map { $0.value }.reduce(0, { $0 + $1 })
    }
    
    var convertedTotalValue: Double {
        currenciesService.convert(totalValue, to: selectedCurrency)
    }
    
    init(currenciesService: CurrenciesServiceProtocol) {
        self.currenciesService = currenciesService
        observeCurrencies()
    }
    
    func addItem(_ product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product == product }) {
            items[index].quantity += quantity
        } else {
            items.append(BasketItem(product: product, quantity: quantity))
        }
    }
    
    func removeItem(_ product: Product, quantity: Int = 1) {
        guard let index = items.firstIndex(where: { $0.product == product }) else { return }
        let quantityInBasket = items[index].quantity
        let quantityToRemove = quantityInBasket >= quantity ? quantity : quantityInBasket
        items[index].quantity -= quantityToRemove
        if items[index].quantity <= 0 {
            items.remove(at: index)
        }
    }
    
    private func observeCurrencies() {
        currenciesService.currenciesPublisher.sink { [weak self] currencies in
            self?.availableCurrencies = currencies
            if let firstCurrency = currencies.first {
                self?.selectedCurrency = firstCurrency
            }
        }
        .store(in: &subscribers)
    }
    
}
