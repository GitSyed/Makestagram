//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Test User on 6/27/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController:UIViewController {
    //MARK: - Subviews
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    // MARK - VC Lifecycle
    override func viewDidLoad() {
        nextButton.layer.cornerRadius = 6
    }
    
    // MARK - IBActions
    @IBAction func nextButtonTapped(_ sender: Any) {
        //create new user in database
        
        
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
            
                return
            
            }
            
            print("Created new user: \(user.username)")
        }
        
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            
            // 5
            
                // handle newly created user here
           
            
            UserService.create(firUser, username: username) { (user) in
                guard let user = user else {
                    //handle error
                    return
                }
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                }

    }
    
    
}
}

