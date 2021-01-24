//
//  SettingHeader.swift
//  Tinder Clone
//
//  Created by Kyo on 1/24/21.
//

import UIKit

class SettingsHeader: UIView {
    // MARK:- Properties
    lazy var button1 = createButton()
    lazy var button2 = createButton()
    lazy var button3 = createButton()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        
        addSubview(button1)
        button1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(snp.centerX).offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(snp.centerX).offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSelectPhoto() {
        
    }
    
    func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Select Photo", for: .normal)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 5
        return button
    }
}
