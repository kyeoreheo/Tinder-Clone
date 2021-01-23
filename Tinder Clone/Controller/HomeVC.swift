//
//  HomeVC.swift
//  Tinder Clone
//
//  Created by Kyo on 1/21/21.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    // MARK:- Properties
    private let topStack = HomeNavigationStackView()
    private let bottomStack = BottomControlsStackView()
    private let deckView = UIView()
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCards()
    }
    
    // MARK:- Configure
    private func configureCards() {
        let cardView1 = CardView()
        let cardView2 = CardView()
        
        deckView.addSubview(cardView1)
        cardView1.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        deckView.addSubview(cardView2)
        cardView2.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        deckView.backgroundColor = .systemPink
        deckView.layer.cornerRadius = 5
        
        let stackView = UIStackView(arrangedSubviews: [topStack, deckView, bottomStack])
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.bringSubviewToFront(deckView)
        stackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
