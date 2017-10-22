//
//  LeftMenuVC.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/14/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit
import Firebase

class LeftSidePanelVC: UIViewController {

    
    let appDelegate = AppDelegate.getAppDelegate()
    let currentUserId = Auth.auth().currentUser?.uid
    
    
    
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userAccountTypeLabel: UILabel!
    @IBOutlet weak var userImageView: RoundImageView!
    @IBOutlet weak var loginoutBtn: UIButton!
    @IBOutlet weak var pickupModeLabel: UILabel!
    @IBOutlet weak var pickupModeSwitch: UISwitch!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pickupModeSwitch.isOn = false
        pickupModeLabel.isHidden = true
        pickupModeSwitch.isHidden = true
        
        observePassengersAndDriver()
        
        if Auth.auth().currentUser == nil {
            userEmailLbl.text = nil
            userAccountTypeLabel.text = ""
            userImageView.isHidden = true
            loginoutBtn.setTitle("SignUp/Login", for: .normal)
        } else {
            userEmailLbl.text = Auth.auth().currentUser?.email
            userAccountTypeLabel.text = ""
            userImageView.isHidden = false
            loginoutBtn.setTitle("Logout", for: .normal)
        }
    }
    
    
    @IBAction func switchWasToggled(_ sender: Any) {
        if pickupModeSwitch.isOn {
            pickupModeLabel.text = "PICKUP MODE ENABLED"
            appDelegate.MenuContainerVC.toggelLeftPanel()
            DataService.instance.REF_DRIVERS.child(currentUserId!).updateChildValues(["isPickUpModeEnabled": true])
        } else {
            pickupModeLabel.text = "PICKUP MODE DISABLED"
            appDelegate.MenuContainerVC.toggelLeftPanel()
            DataService.instance.REF_DRIVERS.child(currentUserId!).updateChildValues(["isPickUpModeEnabled": false])

        }
    }
    
    func observePassengersAndDriver() {
        DataService.instance.REF_USERS.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.userAccountTypeLabel.text = "PASSENGER"
                    }
                }
            }
        })
        
        DataService.instance.REF_DRIVERS.observeSingleEvent(of: .value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if snap.key == Auth.auth().currentUser?.uid {
                        self.userAccountTypeLabel.text = "DRIVER"
                        self.pickupModeSwitch.isHidden = false
                        
                        let switchStatus = snap.childSnapshot(forPath: "isPickUpModeEnabled").value as! Bool
                        self.pickupModeSwitch.isOn = switchStatus
                        self.pickupModeLabel.isHidden = false
                        
                    }
                }
            }
        })
    }
    
    
    @IBAction func signUpLoginButtonWasPressed(_ sender: Any) {
        if Auth.auth().currentUser == nil {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        present(loginVC!, animated: true, completion: nil)
        } else {
            do {
                try Auth.auth().signOut()
                userImageView.isHidden = true
                userEmailLbl.text = ""
                userAccountTypeLabel.text = ""
                pickupModeLabel.text = ""
                pickupModeSwitch.isHighlighted = true
                
                loginoutBtn.setTitle("Sign Up/ Login", for: .normal)
            } catch (let error) {
                print(error)
            }
        }
    }
    


}
