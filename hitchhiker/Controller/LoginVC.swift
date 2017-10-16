//
//  LoginVC.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/15/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.bindtoKeyboard()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }

    @objc func handleScreenTap(sender:UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    
    @IBAction func CancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
