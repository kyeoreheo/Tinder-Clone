//
//  LoginVC.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

class LogInVC: UIViewController {
    // MARK:- Properties
    private let logoImageView = UIImageView()
    private let stackView = UIStackView()
    private let emailTextField = CustomTextField(placeholder: "email")
    private let passwordTextField = CustomTextField(placeholder: "password", type: .password)
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .orange
        
        let gradientLayer = CAGradientLayer()
        view.layer.addSublayer(gradientLayer)
        gradientLayer.colors = [#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1).cgColor, #colorLiteral(red: 0.6622132659, green: 0, blue: 0.08407194167, alpha: 1).cgColor]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = view.frame
        
        view.addSubview(logoImageView)
        logoImageView.image = #imageLiteral(resourceName: "app_icon").withRenderingMode(.alwaysTemplate)
        logoImageView.tintColor = .white
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        stackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
    }
    
    // MARK:- Helpers
}
