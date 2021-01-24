//
//  HomeVC.swift
//  Tinder Clone
//
//  Created by Kyo on 1/21/21.
//

import UIKit
import SnapKit
import Firebase

class HomeVC: UIViewController {
    // MARK:- Properties
    private let topStack = HomeNavigationStackView()
    private let bottomStack = BottomControlsStackView()
    private let deckView = UIView()
    
    private var viewModels = [CardVM]() {
        didSet {
            configureCards()
        }
    }
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        configureUI()
        configureCards()
        fetchUser()
        fetchUsers()
//        logOut()
    }
    
    // MARK:- Configure
    private func configureCards() {
        viewModels.forEach {
            let cardView = CardView(viewModel: $0)
            deckView.addSubview(cardView)
            cardView.snp.makeConstraints { make in
                make.top.left.bottom.right.equalToSuperview()
            }
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        deckView.backgroundColor = .systemPink
        deckView.layer.cornerRadius = 5
        
        topStack.delegate = self
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
    
    // MARK:- Helpers
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.fetchUser(uid: uid) { user in
            
        }
    }
    
    func fetchUsers() {
        Service.fetchUsers { [weak self] users in
            guard let strongSelf = self else { return }
            strongSelf.viewModels = users.map { CardVM(user: $0) }
        }
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            peresntLogInController()
            print("DEBUG:- not logged in")
        } else {
            print("DEBUG:- logged in")
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    func peresntLogInController() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            let nav = UINavigationController(rootViewController: LogInVC())
            nav.modalPresentationStyle = .fullScreen
            strongSelf.present(nav, animated: true)
        }
    }
}

extension HomeVC: HomeNavigationStackViewDelegate {
    func showSettings() {
        let nav = UINavigationController(rootViewController: SettingsVC())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    func showMessages() {
        
    }
}
