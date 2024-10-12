//
//  SimpleShoppingApp.swift
//  SimpleShopping
//
//  Created by AC on 08/10/2024.
//

import SwiftUI

@main
struct SimpleShoppingApp: App {
    
    init() {
        registerDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            CatalogView()
        }
    }
    
}

//MARK: - Register dependencies

extension SimpleShoppingApp {
    
    private func registerDependencies() {
        DIContainer.shared.register(service: ProductsServiceProtocol.self) { _ in
            MockProductsService(products: nil)
        }
        DIContainer.shared.register(service: ConversionRatesServiceProtocol.self) { _ in
            MockConversionRatesService()
        }
        DIContainer.shared.register(service: CurrenciesServiceProtocol.self) { resolver in
            let conversionRatesService = resolver.resolve(ConversionRatesServiceProtocol.self)
            return CurrenciesService(conversionRatesService: conversionRatesService)
        }
    }
    
}
