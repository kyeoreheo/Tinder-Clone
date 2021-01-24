//
//  CardView.swift
//  Tinder Clone
//
//  Created by Kyo on 1/22/21.
//

import UIKit
import SDWebImage

enum SwipeDirection: Int {
    case left = -1
    case right = 1
}

class CardView: UIView {
    // MARK:- Properties
    private let viewModel: CardVM
    
    private let gradientLayer = CAGradientLayer()
    private let profileImageView = UIImageView()
    private let infoLabel = UILabel()
    private let infoButton = UIButton()
    
    // MARK:- Lifecycles
    init(viewModel: CardVM) {
        self.viewModel = viewModel
        super.init(frame: .zero)
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
        layer.cornerRadius = 5
        clipsToBounds = true
        
        addSubview(profileImageView)
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.sd_setImage(with: viewModel.imageURL)
        profileImageView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
        
        layer.addSublayer(gradientLayer)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.5, 1.1]
        
        addSubview(infoLabel)
        infoLabel.numberOfLines = 2
        infoLabel.attributedText = viewModel.userInfoText
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
        switch sender.state {
        case .began:
            superview?.subviews.forEach({
                $0.layer.removeAllAnimations()
            })
        case .changed:
            panCard(sender: sender)
        case .ended:
            resetCardPosition(sender: sender)
        default: break
        }
    }
    
    @objc func handleChangePhoto(sender: UITapGestureRecognizer) {
        let location = sender.location(in: nil).x
        let shouldShowNextPhoto = location > self.frame.width / 2
        
        if shouldShowNextPhoto {
            viewModel.showNextPhoto()
        } else {
            viewModel.showPreviousPhoto()
        }
        
        profileImageView.image = viewModel.imageToShow
    }
    
    // MARK:- Helpers
    func panCard(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: nil)
        let degrees: CGFloat = translation.x / 20
        let angle = degrees * .pi / 180
        let rotaionalTransform = CGAffineTransform(rotationAngle: angle)
        self.transform = rotaionalTransform.translatedBy(x: translation.x, y: translation.y)
    }
    
    func resetCardPosition(sender: UIPanGestureRecognizer) {
        let direction: SwipeDirection = sender.translation(in: nil).x > 100 ? .right : .left
        let shouldDismissCard = abs(sender.translation(in: nil).x) > 100
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: { [weak self] in
            guard let strongSelf = self else { return }
            
            if shouldDismissCard {
                let xTranslation = CGFloat(direction.rawValue) * 1000
                let offScreenTransform = strongSelf.transform.translatedBy(x: xTranslation, y: 0)
            } else {
                strongSelf.transform = .identity
            }
        }) { [weak self] _ in
            guard let strongSelf = self else { return }
            if shouldDismissCard {
                strongSelf.removeFromSuperview()
            }
        }
    }
}
