//
//  LoginVC.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

class LogInVC: UIViewController {
    // MARK:- Properties
    private let viewModel = LogInVM()
    
    private let logoImageView = UIImageView()
    private let stackView = UIStackView()
    private let emailTextField = CustomTextField(placeholder: "email")
    private let passwordTextField = CustomTextField(placeholder: "password", type: .password)
    private let logInButtton = CustomButton(title: "Log In", type: .system)
    private let signInButton = UIButton()
    
    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureGradientLayer()
        configureTextFieldObservers()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .white
        
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
        
        stackView.addArrangedSubview(logInButtton)
        logInButtton.addTarget(self, action: #selector(handleLogIn), for: .touchUpInside)
        logInButtton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        view.addSubview(signInButton)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14)])
        attributedTitle.append(NSMutableAttributedString(string: "Sign In", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 16)]))
        signInButton.setAttributedTitle(attributedTitle, for: .normal)
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
    }
    
    // MARK:- Helpers
    func checkFormStatus() {
        if viewModel.formIsValid {
            logInButtton.isEnabled = true
            logInButtton.backgroundColor = #colorLiteral(red: 0.6622132659, green: 0, blue: 0.08407194167, alpha: 1)
        } else {
            logInButtton.isEnabled = false
            logInButtton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    // MARK:- Selectors
    @objc func handleLogIn() {
        
        AuthService.logUserIn(email: viewModel.email, password: viewModel.password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("DEBUG:- error logging in")
                return
            }
            strongSelf.dismiss(animated: true)
        }
    }
    
    @objc func handleSignIn() {
        navigationController?.pushViewController(SignInVC(), animated: true)
    }
    
    func configureTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(sender: UITextField) {
        guard let text = sender.text else { return }
        if sender == emailTextField {
            viewModel.email = text
        } else {
            viewModel.password = text
        }
        checkFormStatus()
    }
}
