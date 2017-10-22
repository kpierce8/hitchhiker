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
import CoreLocation


class HomeVC: UIViewController, MKMapViewDelegate {

    @IBAction func menuButtonWasPressed(_ sender: Any) {
        delegate?.toggelLeftPanel()
    }
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        centerMapOnUserLocation()
    }
    @IBOutlet weak var actionButton: RoundedShadowButton!
    
    @IBAction func actionButtonWasPressed(_ sender: Any) {
        actionButton.animateButton(shouldLoad: true, withMessage: nil)
    }
    @IBOutlet weak var mapview: MKMapView!
    
    var delegate: CenterVCDelegate?
    var manager: CLLocationManager?
    var regionRadius: CLLocationDistance = 1000
    
    func checkLocationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {


            manager?.startUpdatingLocation()
        } else {
            manager?.requestAlwaysAuthorization()
        }
    }
    
    
    func centerMapOnUserLocation() {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(mapview.userLocation.coordinate, regionRadius * 2.0 , regionRadius * 2.0)
            mapview.setRegion(coordinateRegion, animated: true)
    }
    
    let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "launchScreenIcon")!, iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: UIColor.white )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        
        manager?.delegate = self
        manager?.desiredAccuracy = kCLLocationAccuracyBest
        
        
        checkLocationAuthStatus()
        mapview.delegate = self
        centerMapOnUserLocation()
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = SplashAnimationType.heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true
        
        // Stuff I added to change starting position (removed for lecture 14)
//        let noLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 47.016, longitude: -122.7853)
//        let viewRegion : MKCoordinateRegion  = MKCoordinateRegionMakeWithDistance(noLocation, 10000, 10000)
//        let adjustedRegion: MKCoordinateRegion  = self.mapview.regionThatFits(viewRegion)
//        self.mapview.setRegion(adjustedRegion, animated: true)
//        self.mapview.showsUserLocation = true
        // Do any additional setup after loading the view, typically from a nib.
    }

}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
         checkLocationAuthStatus()
        if status == .authorizedAlways {

            mapview.showsUserLocation = true
            mapview.userTrackingMode = .follow
        }
    }
}
