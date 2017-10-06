//
//  CircleView.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/4/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class CircleView: UIView {

    @IBInspectable var borderColor: UIColor? {
        didSet {
             setUpView()
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width/2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor

    }
}
