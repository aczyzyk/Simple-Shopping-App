//
//  MockProductsService.swift
//  SimpleShopping
//
//  Created by AC on 10/10/2024.
//

import Foundation

actor MockProductsService: ProductsServiceProtocol {
    
    let products: [Product]
    
    init(products: [Product]?) {
        self.products = products ?? [
        Product(id: 1, name: "Potato", unit: "bag", price: 0.95),
        Product(id: 2, name: "Eggs", unit: "dozen", price: 2.10),
        Product(id: 3, name: "Milk", unit: "bottle", price: 1.30),
        Product(id: 4, name: "Banana", unit: "kg", price: 0.73)
        ]
    }
    
    func getProducts() async throws -> [Product] {
        products
    }
    
}
