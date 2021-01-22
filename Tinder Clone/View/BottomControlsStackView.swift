//
//  BottomControlStackView.swift
//  Tinder Clone
//
//  Created by Kyo on 1/22/21.
//
import UIKit

class BottomControlsStackView: UIStackView {
    // MARK:- Properties
    let undoButton = UIButton()
    let disLikeButton = UIButton()
    let superLikeButton = UIButton()
    let likeButton = UIButton()
    let boostButton = UIButton()
    
    // MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        distribution = .equalCentering

        undoButton.setImage(#imageLiteral(resourceName: "refresh_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        disLikeButton.setImage(#imageLiteral(resourceName: "dismiss_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        superLikeButton.setImage(#imageLiteral(resourceName: "super_like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like_circle").withRenderingMode(.alwaysOriginal), for: .normal)
        boostButton.setImage(#imageLiteral(resourceName: "boost_circle").withRenderingMode(.alwaysOriginal), for: .normal)

        [undoButton, disLikeButton, superLikeButton, likeButton, boostButton].forEach { view in
            addArrangedSubview(view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
