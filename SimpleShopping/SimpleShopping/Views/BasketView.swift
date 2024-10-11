//
//  BasketView.swift
//  SimpleShopping
//
//  Created by AC on 11/10/2024.
//

import SwiftUI

struct BasketView: View {
    
    @EnvironmentObject var vm: BasketViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Total: $\(String(format: "%.2f", vm.totalValue))")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            .padding()
            List {
                ForEach(vm.items) { item in
                    BasketItemView(item: item)
                }
            }
        }
        .navigationTitle("Basket")
    }
    
}

#Preview {
    BasketView()
        .environmentObject(BasketViewModel())
}
