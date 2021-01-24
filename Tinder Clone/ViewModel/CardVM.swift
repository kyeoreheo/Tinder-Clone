//
//  CardVM.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

class CardVM {
    public let user: User
    public let userInfoText: NSAttributedString
    public var imageToShow: UIImage?
    public var imageURL: URL?

    private var imageIndex = 0
    
    init(user: User) {
        self.user = user
//        self.imageToShow = user.images.first
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        attributedText.append(NSMutableAttributedString(string: " \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light), .foregroundColor: UIColor.white]))
        self.userInfoText = attributedText
        
        self.imageURL = URL(string: user.profileImageUrl)
    }
    
    func showNextPhoto() {
//        guard imageIndex < user.images.count - 1 else { return }
//        imageIndex += 1
//        self.imageToShow = user.images[imageIndex]
    }
    
    func showPreviousPhoto() {
//        guard imageIndex > 0 else { return }
//        imageIndex -= 1
//        self.imageToShow = user.images[imageIndex]
    }
}
