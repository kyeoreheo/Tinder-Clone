//
//  Service.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import Firebase
import UIKit

class Service {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/images/\(fileName)")
        
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("DEBUG:- Error uploading image \(error.localizedDescription)")
                return
            }
            ref.downloadURL { url, error in
                guard let imageURL = url?.absoluteString else { return }
                completion(imageURL)
            }
        }
    }
}
