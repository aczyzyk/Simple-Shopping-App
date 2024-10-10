//
//  Product.swift
//  SimpleShopping
//
//  Created by AC on 10/10/2024.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let unit: String
    let price: Double
}
