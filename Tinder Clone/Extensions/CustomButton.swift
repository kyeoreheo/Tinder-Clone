//
//  CustomButton.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

class CustomButton: UIButton {
    init(title: String, type: ButtonType) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        layer.cornerRadius = 5
        isEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
