//
//  CounterViewController.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/27/22.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class CounterViewController: UIViewController {
    
    let vm = CounterViewModel()
    let appState = AppState()
    var cancellable: AnyCancellable?
    
    lazy var counterLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        let hostingController = UIHostingController(rootView: CounterView().environmentObject(appState))
        
        guard let counterView = hostingController.view else { return }
        self.addChild(hostingController)
        
        self.view.addSubview(counterView)
        
        // add subscriptions
        
        self.cancellable = appState.$counter.sink(receiveValue: { [weak self] value in
            self?.counterLabel.text = "\(value)"
        })
        
        /*
        self.cancellable = vm.$value.sink { [weak self] value in
            self?.counterLabel.text = "\(value)"
        } */
        
        // stack view
        let stackView = UIStackView(arrangedSubviews: [counterLabel, counterView])
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        // adding constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }
}
