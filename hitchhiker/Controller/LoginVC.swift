//
//  LoginVC.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/15/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {

 
    @IBOutlet weak var emailField: RoundedCornerTextField!
 
    @IBOutlet weak var passwordField: RoundedCornerTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var authButton: RoundedShadowButton!
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        
        
        view.bindtoKeyboard()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
    }
    
    
    @IBAction func authButtonWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            authButton.animateButton(shouldLoad: true, withMessage: nil)
            self.view.endEditing(true)
        
            if let email = emailField.text, let password = passwordField.text {
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error == nil {
                        if let user = user {
                            if self.segmentedControl.selectedSegmentIndex == 0 {
                                let userData = ["provider": user.providerID] as [String:Any]
                                DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: false)
                            } else {
                                let userData = ["provider": user.providerID, "userIsDriver":true, "isPickUpModeEnabled":false, "driverIsOnTrip":false] as [String:Any]
                                DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: true)
                            }
                        }
                        print("Email user authenticated successfully with firebase")
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        if let errorCode = AuthErrorCode(rawValue: error!._code){
                            switch errorCode {
                            case .invalidEmail:
                                print("Email invalid")
                            case .wrongPassword:
                                print("whoops, wrong password")
                            default:
                                print("don't know what happened maybe it was \(errorCode.rawValue    )")
                            }
                        }
                        
                        
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                if let errorCode = AuthErrorCode(rawValue: error!._code){
                                    switch errorCode {
                                    case .invalidEmail:
                                        print("Email invalid")
                                    case .emailAlreadyInUse:
                                        print("try a different email, email in use")
                                    default:
                                        print("don't know what happened maybe it was \(errorCode.rawValue    )")
                                    }
                                }
                               
                            } else {
                                if let user = user {
                                    if self.segmentedControl.selectedSegmentIndex == 0 {
                                        let userData = ["provider" : user.providerID] as [String: Any]
                                        DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: false)
                                    } else {
                                        let userData = ["provider" : user.providerID, "userIsDriver":true, "isPickUpModeEnabled": false, "driverIsOnTrip":false] as [String: Any]
                                        DataService.instance.createFirebaseDBUser(uid: user.uid, userData: userData, isDriver: true)
                                    }
                                }
                                print("wow successfully created new user")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    
    @objc func handleScreenTap(sender:UITapGestureRecognizer) {
            self.view.endEditing(true)
    }
    
    @IBAction func CancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
