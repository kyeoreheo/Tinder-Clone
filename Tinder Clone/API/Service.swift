//
//  Service.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import Firebase
import UIKit

class Service {
    static func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = User(dictionary: dictionary)
            completion(user)
            print("DEBUG:- snapshot \(snapshot?.data())")
        }
    }
    
    static func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        COLLECTION_USERS.getDocuments { snapshot, error in
            snapshot?.documents.forEach {
                users.append(User(dictionary: $0.data()))
                
                if users.count == snapshot?.documents.count {
                    completion(users)
                }
            }
        }
    }
    
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
