//
//  User.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

struct User {
    var name: String
    var age: Int
    var email: String
    let uid: String
    let profileImageUrl: String
//    var images: [UIImage]
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["fullName"] as? String ?? ""
        self.age = dictionary["age"] as? Int ?? 0
        self.email = dictionary["email"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.profileImageUrl = dictionary["imageURL"] as? String ?? ""
    }
}
