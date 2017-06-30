//
//  mainTabBarController.swift
//  Makestagram
//
//  Created by Test User on 6/30/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {

    override  func viewDidLoad(){
         super.viewDidLoad()
        
        //1
        delegate = self
        //2
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController:UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
          //present photo taking action sheet 
            print("take photo")
            
            return false
        } else {
            return true
        }
        
    }
}
