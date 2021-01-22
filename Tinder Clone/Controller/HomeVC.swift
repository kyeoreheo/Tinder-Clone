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
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK:- Configure
    private func configureUI() {
        view.backgroundColor = .white

        view.addSubview(topStack)
        topStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
        }
    }
}
