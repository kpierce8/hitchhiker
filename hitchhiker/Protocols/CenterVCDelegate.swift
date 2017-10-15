//
//  CenterVCDelegate.swift
//  hitchhiker
//
//  Created by Ken Pierce on 10/14/17.
//  Copyright © 2017 Ken Pierce. All rights reserved.
//

import Foundation
import UIKit

protocol CenterVCDelegate {
    func toggelLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldExpand: Bool)
}
