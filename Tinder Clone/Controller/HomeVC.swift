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
        let user1 = User(name: "Cat cat", age: 20, images: [#imageLiteral(resourceName: "jane1"),#imageLiteral(resourceName: "jane3")])
        let user2 = User(name: "Dog Dog", age: 21, images: [#imageLiteral(resourceName: "kelly1"),#imageLiteral(resourceName: "kelly2"),#imageLiteral(resourceName: "lady5c")])
        let cardView1 = CardView(viewModel: CardVM(user: user1))
        let cardView2 = CardView(viewModel: CardVM(user: user2))
        
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
