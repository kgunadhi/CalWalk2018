//
//  AnnotationPin.swift
//  IOS-Swift-MapKitCustomAnnotation01
//
//  Created by Emily Lu on 11/3/18.
//  Copyright © 2018 elu. All rights reserved.
//

import MapKit

class AnnotationPin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
