//
//  PostService.swift
//  Makestagram
//
//  Created by Test User on 7/1/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct PostService {
    static func create(for image: UIImage) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
     
            func create(for image: UIImage) {
                let imageRef = Storage.storage().reference().child("test_image.jpg")
                StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
                    guard let downloadURL = downloadURL else {
                        return
                    }
                    
                    let urlString = downloadURL.absoluteString
                    let aspectHeight = image.aspectHeight
                    create(forURLString: urlString, aspectHeight: aspectHeight)
            }
    }

}

}
}
