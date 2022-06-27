//
//  ContentView.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/24/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading: Bool = false
    
    
    var body: some View {
        VStack {
            LoadingView(loading: isLoading)
            Button("Toggle") {
                isLoading.toggle()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
