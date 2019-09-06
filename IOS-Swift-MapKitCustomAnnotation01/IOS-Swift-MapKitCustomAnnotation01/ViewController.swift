//
//  ViewController.swift
//  IOS-Swift-MapKitCustomAnnotation01
//
//  Created by Emily Lu on 11/3/18.
//  Copyright © 2018 elu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var pin:AnnotationPin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        mapView.delegate = self
        mapView.mapType = .hybrid
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.8737, longitude: -122.2579)
        let regin = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(regin, animated: true)
        
        pin = AnnotationPin(title: "Evans Hall", subtitle: "Berkeley", coordinate: coordinate)
        mapView.addAnnotation(pin)
            
        let coordinate_2 = CLLocationCoordinate2D(latitude: 37.8696, longitude: -122.2588)
        let regin_2 = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        
        mapView.setRegion(regin_2, animated: true)
        pin = AnnotationPin(title: "Sproul Hall", subtitle: "Berkeley", coordinate: coordinate_2)
        mapView.addAnnotation(pin)
        
        let coordinate_3 = CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2621)
        let regin_3 = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        
        mapView.setRegion(regin_3, animated: true)
        pin = AnnotationPin(title: "Valley Life Sciences Building", subtitle: "Berkeley", coordinate: coordinate_3)
        mapView.addAnnotation(pin)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "SproulHall")
        annotationView.image = UIImage(named: "People_Pin.png")
        let transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        annotationView.transform = transform
        return annotationView
    }
}

