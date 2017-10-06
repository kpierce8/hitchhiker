//
//  RoundedShadowButton.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/4/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {

    var originalSize: CGRect?
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    
    func setUpView() {
        originalSize = self.frame
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize.zero  //want it to stay in center
    }
    
    func animateButton2(shouldLoad:Bool, withMessage message: String?) {
        let spinner = UIActivityIndicatorView()
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.color = UIColor.darkGray
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
        spinner.tag = 21
        
        if shouldLoad {
            self.addSubview(spinner)
            self.setTitle("", for: .normal)
            
            UIView.animate(withDuration: 0.8, animations:{
                self.layer.cornerRadius = self.frame.height/2
                // self.frame.midX-(self.frame.width/2) moves button to middle accounting for width
                print("shrinking")
                self.frame = CGRect(x: self.frame.midX-(self.frame.width/2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
                }, completion:
                { (finished) in
                if finished == true {
                    spinner.startAnimating()
                    print("Starting animation")
                    spinner.center = CGPoint(x: self.frame.width/2 + 1, y: self.frame.width/2 + 1)
                    }
            })
                    
//                    UIView.animate(withDuration: 0.8, animations: {
//                        spinner.alpha = 1.0
//                        })
                    
                    self.isUserInteractionEnabled = false
                    print("disabling user interaction")
                    } else {
                    self.isUserInteractionEnabled = true
                    print("enable again")
                    for subview in self.subviews {
                        if subview.tag == 21 {
                            subview.removeFromSuperview()
                            }
                        }
            
            
                print("expanding button back")
                UIView.animate(withDuration: 0.8, animations: {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalSize!
                self.setTitle(message, for: .normal)
                    })
        
        }
    }
    
    func animateButton(shouldLoad: Bool, withMessage message: String?) {
        let spinner = UIActivityIndicatorView()
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.color = UIColor.darkGray
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
        spinner.tag = 21
        
        if shouldLoad {
            self.addSubview(spinner)
            
            self.setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
            }, completion: { (finished) in
                if finished == true {
                    spinner.startAnimating()
                    spinner.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.width / 2 + 1)
                    spinner.alpha = 1.0
                }
            })
            self.isUserInteractionEnabled = false
        } else {
            self.isUserInteractionEnabled = true
            
            for subview in self.subviews {
                if subview.tag == 21 {
                    subview.removeFromSuperview()
                }
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalSize!
                self.setTitle(message, for: .normal)
            })
        }
    }

    
}
