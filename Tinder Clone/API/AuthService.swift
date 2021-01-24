//
//  AuthService.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let profileImage: UIImage?
}

class AuthService {
    static func registerUser(credentials: AuthCredentials, completion: @escaping (Error?) -> Void) {
        print("DEBUG:- registerUser with Firebase")
        guard let image = credentials.profileImage else { return }
        Service.uploadImage(image: image) { imageURL in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
                if let error = error {
                    print("DEBUG:- error signing user \(error.localizedDescription)")
                    return
                }
                guard let uid = result?.user.uid else { return }
                let data = ["email" : credentials.email,
                            "fullName": credentials.fullName,
                            "imageURL": imageURL,
                            "uid": uid,
                            "age": 21] as [String: Any]
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
}
