//
//  ViewController.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/2/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var actionButton: RoundedShadowButton!
    
    @IBAction func actionButtonWasPressed(_ sender: Any) {
        actionButton.animateButton(shouldLoad: true, withMessage: nil)
    }
    @IBOutlet weak var mapview: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview.delegate = self
        let noLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 50, longitude: -122)
        let viewRegion : MKCoordinateRegion  = MKCoordinateRegionMakeWithDistance(noLocation, 500, 500)
        let adjustedRegion: MKCoordinateRegion  = self.mapview.regionThatFits(viewRegion)
        self.mapview.setRegion(adjustedRegion, animated: true)
        self.mapview.showsUserLocation = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    


}

