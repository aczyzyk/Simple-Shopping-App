//
//  BasketItem.swift
//  SimpleShopping
//
//  Created by AC on 12/10/2024.
//

import Foundation

struct BasketItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}

extension BasketItem {
    var value: Double { product.price * Double(quantity) }
}
