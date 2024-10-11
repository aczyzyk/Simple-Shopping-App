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
                Text("\(basket.items.count) items")
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
        .environmentObject(BasketViewModel())
}
