//
//  CardView.swift
//  Tinder Clone
//
//  Created by Kyo on 1/22/21.
//

import UIKit

class CardView: UIView {
    // MARK:- Properties
    private let gradientLayer = CAGradientLayer()
    private let profileImageView = UIImageView()
    private let infoLabel = UILabel()
    private let infoButton = UIButton()
    
    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGestureRecognizers()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.frame
    }
    
    // MARK:- Configures
    func configureGestureRecognizers() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlelPanGesture))
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleChangePhoto))
        addGestureRecognizer(pan)
        addGestureRecognizer(tap)
    }
    
    func configureUI() {
        backgroundColor = .purple
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(profileImageView)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.image = #imageLiteral(resourceName: "lady4c")
        profileImageView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        
        addSubview(infoLabel)
        infoLabel.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "Name Name", attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy), .foregroundColor: UIColor.white])
        attributedText.append(NSMutableAttributedString(string: " 20", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light), .foregroundColor: UIColor.white]))
        infoLabel.attributedText = attributedText
        infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        addSubview(infoButton)
        infoButton.setImage(#imageLiteral(resourceName: "info_icon").withRenderingMode(.alwaysOriginal), for: .normal)
        infoButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(infoLabel.snp.centerY)
        }
    }
    
    // MARK:- Actions
    @objc func handlelPanGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        
        switch sender.state {
        case .began:
            print("DEBUG:- began")
        case .changed:
            let degrees: CGFloat = translation.x / 20
            let angle = degrees * .pi / 180
            let rotaionalTransform = CGAffineTransform(rotationAngle: angle)
            self.transform = rotaionalTransform.translatedBy(x: translation.x, y: translation.y)
        case .ended:
            print("DEBUG:- ended")
        default: break
        }
    }
    
    @objc func handleChangePhoto(sender: UITapGestureRecognizer) {
        print("DEBUG:- tapped")
    }
    
    // MARK:- Helpers
    
}
