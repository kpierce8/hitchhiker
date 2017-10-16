//
//  LeftMenuVC.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/14/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import UIKit

class LeftSidePanelVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func signUpLoginButtonWasPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        present(loginVC!, animated: true, completion: nil)
    }
    


}
