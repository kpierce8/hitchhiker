//
//  PassengerAnnotation.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/29/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import Foundation
import MapKit

class PassengerAnnotation: NSObject, MKAnnotation {
    // MKAnnotation requires dynamic
    dynamic var coordinate: CLLocationCoordinate2D
    var key: String
    
    init(coordinate: CLLocationCoordinate2D, key: String) {
        self.coordinate = coordinate
        self.key = key
        super.init()
    }
}
