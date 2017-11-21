//
//  RoundMapView.swift
//  hitchhiker
//
//  Created by Ken Pierce on 11/20/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit
import MapKit

class RoundMapView: MKMapView {

    func setUpView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 10.0
    }

    override func awakeFromNib() {
        setUpView()
    }
    
}
