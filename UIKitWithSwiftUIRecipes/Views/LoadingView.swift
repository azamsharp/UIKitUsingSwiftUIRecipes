//
//  ProgressView.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/24/22.
//

import SwiftUI

struct LoadingView: UIViewRepresentable {
    
    var loading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if loading {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
    typealias UIViewType = UIActivityIndicatorView
    
    
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(loading: true)
    }
}
