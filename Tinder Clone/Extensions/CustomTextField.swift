//
//  CustomView.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

enum TextType {
    case email
    case password
}

class CustomTextField: UITextField {
    init(placeholder: String, type: TextType = .email) {
        super.init(frame: .zero)
        
        setLeftPaddingPoints(12)
        borderStyle = .none
        textColor = .white
        backgroundColor = UIColor(white: 1, alpha: 0.2)
        layer.cornerRadius = 5
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        if type == .password {
            isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
