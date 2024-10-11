//
//  BasketViewModel.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import Foundation

struct BasketItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
    var value: Double { product.price * Double(quantity) }
}

class BasketViewModel: ObservableObject {

    @Published var items: [BasketItem] = []
    @Published var totalValue: Double = 0
    
    func addItem(_ product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product == product }) {
            items[index].quantity += quantity
        } else {
            items.append(BasketItem(product: product, quantity: quantity))
        }
        updateValues()
    }
    
    func removeItem(_ product: Product, quantity: Int = 1) {
        guard let index = items.firstIndex(where: { $0.product == product }) else { return }
        let quantityInBasket = items[index].quantity
        let quantityToRemove = quantityInBasket >= quantity ? quantity : quantityInBasket
        items[index].quantity -= quantityToRemove
        if items[index].quantity <= 0 {
            items.remove(at: index)
        }
        updateValues()
    }
    
    private func updateValues() {
        totalValue = items.map { $0.value }.reduce(0, { $0 + $1 })
    }
    
}
