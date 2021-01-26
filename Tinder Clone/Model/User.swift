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
    var profession: String
    var email: String
    let uid: String
    let imageURLs: [String]
    var minSeekingAge: Int
    var maxSeekingAge: Int
    var bio: String
//    var images: [UIImage]
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["fullName"] as? String ?? ""
        self.age = dictionary["age"] as? Int ?? 0
        self.profession = dictionary["profession"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.imageURLs = dictionary["imageURLs"] as? [String] ?? [String]()
        self.minSeekingAge = dictionary["minSeekingAge"] as? Int ?? 18
        self.maxSeekingAge = dictionary["maxSeekingAge"] as? Int ?? 40
        self.bio = dictionary["bio"] as? String ?? ""
    }
}
