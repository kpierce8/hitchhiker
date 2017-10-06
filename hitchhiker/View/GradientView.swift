//
//  GradientView.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/4/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class GradientView: UIView {

  let gradient = CAGradientLayer()
    
    
    override func awakeFromNib() {
        setUpGradientView()
    }
    
    func setUpGradientView() {
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        
        gradient.startPoint = CGPoint.zero //zero is top left
        gradient.endPoint = CGPoint(x: 0, y: 1)  //from top to bottom
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
        
    }

}
