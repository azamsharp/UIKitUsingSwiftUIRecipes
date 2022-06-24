//
//  StocksScreen.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/24/22.
//

import SwiftUI

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

struct Stock: Identifiable {
    
    let id = UUID()
    let name: String
    let price: Double
}

struct StocksScreen: View {
    
    let stocks = [Stock(name: "MSFT", price: 250), Stock(name: "AAPL", price: 140.56)]
    
    var body: some View {
        List(stocks) { stock in
            HStack {
                Text(stock.name)
                Spacer() 
                Text(stock.price.formatAsCurrency())
            }
        }.navigationTitle("Stocks")
    }
}

struct StocksScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StocksScreen()
        }
    }
}
