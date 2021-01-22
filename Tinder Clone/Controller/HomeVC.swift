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
    }
    
    // MARK:- Configure
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
