//
//  CatalogViewModel.swift
//  SimpleShopping
//
//  Created by AC on 10/10/2024.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    let productsService: ProductsServiceProtocol
    
    @Published var products: [Product] = []
    
    init(productsService: ProductsServiceProtocol) {
        self.productsService = productsService
    }
    
    func loadProducts() {
        Task {
            do {
                let loadedProducts = try await productsService.getProducts()
                await MainActor.run { products = loadedProducts }
            } catch {
                print("Failed to load products")
            }
        }
    }
    
    func addToBasket(id: Int) {
        //TODO:
        print("ADD TO BASKET: \(id)")
    }
    
}
