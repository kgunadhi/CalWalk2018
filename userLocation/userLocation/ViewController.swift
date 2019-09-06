//
//  ViewController.swift
//  userLocation
//
//  Created by Anna Chang on 11/3/18.
//  Copyright © 2018 Anna Chang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    //Map
    @IBOutlet weak var map: MKMapView!
    var pin:AnnotationPin!
    var pin2:AnnotationPin!
    var pin3:AnnotationPin!
    
    var myCoordinates: CLLocationCoordinate2D!
    
    let manager = CLLocationManager()
    /*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
    }
 */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Directions
        
        map.delegate = self
        map.showsScale = true
        map.showsPointsOfInterest = true
        map.showsUserLocation = true
        
        manager.requestAlwaysAuthorization()
        manager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
        }
        
        let sourceCoordinates = manager.location?.coordinate
        let destinationCoordinates = myCoordinates!
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinates!)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceItem
        directionRequest.destination = destinationItem
        directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler: {
            response, error in
            guard let response = response else {
                if let error = error {
                    print("Error!")
                }
                return
            }
            let route = response.routes[0]
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
        })
        map.mapType = .hybrid
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.8737, longitude: -122.2579)
        let regin = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.setRegion(regin, animated: true)
        
        pin = AnnotationPin(title: "Evans Hall", subtitle: "Berkeley", coordinate: coordinate)
        map.addAnnotation(pin)
        
        let coordinate_2 = CLLocationCoordinate2D(latitude: 37.8696, longitude: -122.2588)
        let regin_2 = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        
        map.setRegion(regin_2, animated: true)
        pin2 = AnnotationPin(title: "Sproul Hall", subtitle: "Berkeley", coordinate: coordinate_2)
        map.addAnnotation(pin2)
        
        let coordinate_3 = CLLocationCoordinate2D(latitude: 37.8715, longitude: -122.2621)
        let regin_3 = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        
        map.setRegion(regin_3, animated: true)
        pin3 = AnnotationPin(title: "Valley Life Sciences Building", subtitle: "Berkeley", coordinate: coordinate_3)
        map.addAnnotation(pin3)
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        
        return renderer
    }



}
