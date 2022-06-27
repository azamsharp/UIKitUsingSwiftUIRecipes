//
//  LoginScreen.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/26/22.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var rating: Int?
    
    var body: some View {
       RatingView(rating: $rating)
            .onChange(of: rating) { newValue in
                print(newValue)
            }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
