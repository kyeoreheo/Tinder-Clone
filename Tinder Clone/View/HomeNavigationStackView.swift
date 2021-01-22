//
//  HomeNavigationStackVieew.swift
//  Tinder Clone
//
//  Created by Kyo on 1/21/21.
//

import UIKit

class HomeNavigationStackView: UIStackView {
    // MARK:- Properties
    let settingButton = UIButton()
    let messageButton = UIButton()
    let tinderIcon = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
    
    // MARK:- Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingButton.setImage(#imageLiteral(resourceName: "top_left_profile").withRenderingMode(.alwaysOriginal), for: .normal)
        messageButton.setImage(#imageLiteral(resourceName: "top_right_messages").withRenderingMode(.alwaysOriginal), for: .normal)
        [settingButton, UIView(), tinderIcon, UIView(), messageButton].forEach { view in
            addArrangedSubview(view)
        }
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
