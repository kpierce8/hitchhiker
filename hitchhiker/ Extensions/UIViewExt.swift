//
//  UIViewExt.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/15/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alphaValue:CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) {
            self.alpha = alphaValue
        }
    }
}
