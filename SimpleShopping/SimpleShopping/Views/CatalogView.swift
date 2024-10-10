//
//  CatalogView.swift
//  SimpleShopping
//
//  Created by AC on 08/10/2024.
//

import SwiftUI

struct CatalogView: View {
    
    @StateObject var vm = CatalogViewModel(
        productsService: DIContainer.shared.resolve(ProductsServiceProtocol.self)
    )
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.products) { product in
                    productTile(product)
                }
            }
            .navigationTitle("Product Catalog")
            .task { vm.loadProducts() }
        }
    }
    
    private func productTile(_ product: Product) -> some View {
        HStack {
            Image(systemName: "plus.square.fill")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onTapGesture { vm.addToBasket(id: product.id) }
            Text(product.name)
                .font(.headline)
            Spacer()
            VStack(alignment: .trailing) {
                Text("$"+String(format: "%.2f", product.price))
                Text(" per \(product.unit)")
            }
        }
    }
    
}

#Preview {
    CatalogView()
}
