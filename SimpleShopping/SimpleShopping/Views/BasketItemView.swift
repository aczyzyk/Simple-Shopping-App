//
//  BasketItemView.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import SwiftUI

struct BasketItemView: View {
    
    let item: BasketItem
    
    @EnvironmentObject var basket: BasketViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(item.product.name)
                    .font(.headline)
                Text("\(item.quantity) x $"+String(format: "%.2f", item.product.price)+" per \(item.product.unit)")
            }
            Spacer()
            Text("$"+String(format: "%.2f", item.value))
                .font(.headline)
            Image(systemName: "cart.badge.minus")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onTapGesture { basket.removeItem(item.product) }
            Image(systemName: "cart.badge.plus")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .onTapGesture { basket.addItem(item.product) }
        }
    }
    
}

#Preview {
    let product = Product(id: 1,
                          name: "Potato",
                          unit: "bag",
                          price: 1.2)
    return BasketItemView(item: BasketItem(product: product,
                                           quantity: 2))
}
