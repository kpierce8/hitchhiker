//
//  RoundedShadowView.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/4/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class RoundedShadowView: UIView {

    override func awakeFromNib() {
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.shadowOpacity = 0.3
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0, height: 5.0)
        self.layer.shadowRadius = 5.0
    
    }

}
