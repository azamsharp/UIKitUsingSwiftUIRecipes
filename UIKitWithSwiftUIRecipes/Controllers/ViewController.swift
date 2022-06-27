//
//  ViewController.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/24/22.
//

import UIKit
import SwiftUI
import Combine

class ViewController: UIViewController, ObservableObject {

    @Published var rating: Int? = 3
    var cancellable: AnyCancellable?
    
    
    lazy var ratingLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    }()
    
    
    private struct HolderView: View {
        
        @ObservedObject var vc: ViewController
        
        var body: some View {
            RatingView(rating: $vc.rating)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    
        let hostingController = UIHostingController(rootView: HolderView(vc: self))
        
        guard let ratingsView = hostingController.view else { return }
        self.addChild(hostingController)
        
        self.view.addSubview(ratingsView)
        
        
        self.cancellable = $rating.sink { [weak self] rating in
            
            if let rating {
                // Now you have access to the rating 
                self?.ratingLabel.text = "\(rating)"
            }
        }
        
        // stack view
        let stackView = UIStackView(arrangedSubviews: [ratingLabel, ratingsView])
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        // add constraints on the ratings view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
    }

}

