//
//  SettingHeader.swift
//  Tinder Clone
//
//  Created by Kyo on 1/24/21.
//

import UIKit

protocol SettingsHeaderDelegate: class {
    func settingsHeader(_ header: SettingsHeader, didSelect index: Int)
}

class SettingsHeader: UIView {
    // MARK:- Properties
    lazy var buttons = [createButton(index: 0), createButton(index: 1), createButton(index: 2)]
//    lazy var button1 = createButton(index: 0)
//    lazy var button2 = createButton(index: 1)
//    lazy var button3 = createButton(index: 2)
    let stackView = UIStackView()
    
    weak var delegate: SettingsHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        
        addSubview(buttons[0])
        buttons[0].snp.makeConstraints { make in
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
        
        stackView.addArrangedSubview(buttons[1])
        stackView.addArrangedSubview(buttons[2])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleSelectPhoto(sender: UIButton) {
        delegate?.settingsHeader(self, didSelect: sender.tag)
    }
    
    func createButton(index: Int) -> UIButton {
        let button = UIButton()
        button.setTitle("Select Photo", for: .normal)
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 5
        button.tag = index
        return button
    }
}
