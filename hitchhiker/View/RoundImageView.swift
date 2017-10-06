//
//  RoundImageView.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/4/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {

    override func awakeFromNib() {
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }

}
