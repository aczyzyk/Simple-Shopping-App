//
//  CheckoutButton.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import SwiftUI

struct CheckoutButton: View {
    
    @EnvironmentObject var basket: BasketViewModel
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "cart")
                    .font(.title)
                VStack(alignment: .trailing) {
                    Text("$\(String(format: "%.2f", basket.totalValue))")
                        .font(.subheadline)
                    Text("\(basket.items.count) items")
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding()
        }
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CheckoutButton()
        .environmentObject(BasketViewModel(currenciesService: DIContainer.shared.resolve(CurrenciesServiceProtocol.self)))
}
