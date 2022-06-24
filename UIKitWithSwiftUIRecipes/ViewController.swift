//
//  ViewController.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/24/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    lazy var navigateToStocksButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Navigate to Stocks", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        navigateToStocksButton.addAction(UIAction { _ in
            self.navigationController?.pushViewController(UIHostingController(rootView: StocksScreen()), animated: true)
        }, for: .touchUpInside)
        
        
        self.view.addSubview(navigateToStocksButton)
        
        navigateToStocksButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        navigateToStocksButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
    }

}

