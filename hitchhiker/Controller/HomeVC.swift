//
//  ViewController.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/2/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView


class HomeVC: UIViewController, MKMapViewDelegate {

    @IBAction func menuButtonWasPressed(_ sender: Any) {
        delegate?.toggelLeftPanel()
    }
    @IBOutlet weak var actionButton: RoundedShadowButton!
    
    @IBAction func actionButtonWasPressed(_ sender: Any) {
        actionButton.animateButton(shouldLoad: true, withMessage: nil)
    }
    @IBOutlet weak var mapview: MKMapView!
    
    var delegate: CenterVCDelegate?
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor.white )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapview.delegate = self
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true
        
        // Stuff I added to change starting position
        let noLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 47.016, longitude: -122.7853)
        let viewRegion : MKCoordinateRegion  = MKCoordinateRegionMakeWithDistance(noLocation, 10000, 10000)
        let adjustedRegion: MKCoordinateRegion  = self.mapview.regionThatFits(viewRegion)
        self.mapview.setRegion(adjustedRegion, animated: true)
        self.mapview.showsUserLocation = true
        // Do any additional setup after loading the view, typically from a nib.
    }

}

