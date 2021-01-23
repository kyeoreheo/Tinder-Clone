//
//  SignInVC.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

class SignInVC: UIViewController {
    // MARK:- Properties
    private let viewModel = SignInVM()
    
    private let selectPhotoButton = UIButton()
    private let stackView = UIStackView()
    private let emailTextField = CustomTextField(placeholder: "email")
    private let fullNameTextField = CustomTextField(placeholder: "full name")
    private let passwordTextField = CustomTextField(placeholder: "password", type: .password)
    private let registerButtton = CustomButton(title: "Register", type: .system)
    private let signInButton = UIButton()

    // MARK:- Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFieldObservers()
        configureGradientLayer()
        configureUI()
    }
    
    // MARK:- Configures
    private func configureUI() {
        view.backgroundColor = .purple
        
        view.addSubview(selectPhotoButton)
        selectPhotoButton.clipsToBounds = true
        selectPhotoButton.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysTemplate), for: .normal)
        selectPhotoButton.tintColor = .white
        selectPhotoButton.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        selectPhotoButton.snp.makeConstraints { make in
            make.height.width.equalTo(275)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
        }
        
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.snp.makeConstraints { make in
            make.top.equalTo(selectPhotoButton.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }
        
        stackView.addArrangedSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(fullNameTextField)
        fullNameTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }

        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        stackView.addArrangedSubview(registerButtton)
        registerButtton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        view.addSubview(signInButton)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 14)])
        attributedTitle.append(NSMutableAttributedString(string: "Sign In", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 16)]))
        signInButton.setAttributedTitle(attributedTitle, for: .normal)
        signInButton.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        signInButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
        }

    }
    
    // MARK:- Helpers
    func checkFormStatus() {
        if viewModel.formIsValid {
            registerButtton.isEnabled = true
            registerButtton.backgroundColor = #colorLiteral(red: 0.6622132659, green: 0, blue: 0.08407194167, alpha: 1)
        } else {
            registerButtton.isEnabled = false
            registerButtton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
    
    @objc func handleSelectPhoto() {
        let picker = UIImagePickerController()
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func handleRegisterUser() {
        
    }
    
    @objc func handleShowLogIn() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureTextFieldObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(sender: UITextField) {
        guard let text = sender.text else { return }
        if sender == emailTextField {
            viewModel.email = text
        } else if sender == fullNameTextField {
            viewModel.fullName = text
        } else {
            viewModel.password = text
        }
        checkFormStatus()
    }
}

extension SignInVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        selectPhotoButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        selectPhotoButton.layer.borderColor = UIColor(white: 1, alpha: 0.7).cgColor
        selectPhotoButton.layer.borderWidth = 3
        selectPhotoButton.layer.cornerRadius = 10
        selectPhotoButton.imageView?.contentMode = .scaleAspectFill
        dismiss(animated: true)
    }
}
