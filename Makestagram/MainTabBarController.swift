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
    
    let photoHelper = MGPhotoHelper()

    override  func viewDidLoad(){
         super.viewDidLoad()
        
        photoHelper.completionHandler = {  image in
            print("handle image")
        }
        
        //1
        delegate = self
        //2
        tabBar.unselectedItemTintColor = .black
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController:UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 2 {
            photoHelper.presentActionSheet (from: self)
            return false
            
        }
            return true
    }
}
