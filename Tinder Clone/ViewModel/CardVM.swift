//
//  CardVM.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

struct CardVM {
    let user: User
    let userInfoText: NSAttributedString
    private var imageIndex = 0
    
    init(user: User) {
        self.user = user
        let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        attributedText.append(NSMutableAttributedString(string: " \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light), .foregroundColor: UIColor.white]))
        self.userInfoText = attributedText
    }
    
    func showNextPhoto() {
        
    }
    
    func showPreviousPhoto() {
        
    }
}
