//
//  MapView.swift
//  UIKitWithSwiftUIRecipes
//
//  Created by Mohammad Azam on 6/24/22.
//

import Foundation
import MapKit
import SwiftUI

class AppleMarkerAnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        frame = CGRect(x: 0, y: 0, width: 25, height: 30)
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) has not been implemented!")
    }
    
    private func setup() {
        let imageView = UIImageView(image: UIImage(systemName: "applelogo"))
        self.addSubview(imageView)
        imageView.frame = bounds
    }
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapView: MKMapView?
    
    override init() {
        super.init()
        registerMapAnnotationViews()
    }
    
    private func registerMapAnnotationViews() {
        
        guard let mapView = mapView else {
            return
        }
        
        mapView.register(AppleMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(AppleMarkerAnnotationView.self))
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        print("VIEWFOR")
        switch annotation {
            case is MKPointAnnotation:
                return AppleMarkerAnnotationView(annotation: annotation, reuseIdentifier: NSStringFromClass(AppleMarkerAnnotationView.self))
            default:
                print("NIL")
                return nil
        }
    }
}

struct MapView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        //map.delegate = context.coordinator
        //context.coordinator.mapView = map
        
        // add annotation
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.title = "Apple Campus"
        pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: 37.331821, longitude: -122.031181)
        
        map.addAnnotation(pointAnnotation)
        
        return map 
    }
   
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
    
}
