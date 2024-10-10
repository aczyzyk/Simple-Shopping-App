//
//  ProductsServiceProtocol.swift
//  SimpleShopping
//
//  Created by AC on 10/10/2024.
//

import Foundation

protocol ProductsServiceProtocol {
    func getProducts() async throws -> [Product]
}
