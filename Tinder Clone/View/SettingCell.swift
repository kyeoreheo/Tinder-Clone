//
//  SettingCell.swift
//  Tinder Clone
//
//  Created by Kyo on 1/24/21.
//

import UIKit

class SettingCell: UITableViewCell {
    // MARK:- Properties
    var viewModel: SettingVM? {
        didSet { configure() }
    }
    lazy var inputField = UITextField()
    let sliderStack = UIStackView()
    let minAgeLabel = UILabel()
    let maxAgeLabel = UILabel()
    lazy var minAgeSlider = createAgeRangeSlider()
    lazy var maxAgeSlider = createAgeRangeSlider()
    
    // MARK:- Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .orange
        
        addSubview(inputField)
        inputField.borderStyle = .none
        inputField.font = .systemFont(ofSize: 16)
        inputField.setLeftPaddingPoints(50)
        inputField.leftViewMode = .always
        inputField.placeholder = "Enter value here.."
        inputField.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
//        inputField.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        let minStack = UIStackView(arrangedSubviews: [minAgeLabel, minAgeSlider])
        minStack.spacing = 24
        minAgeLabel.text = "Min: 18"
        
        let maxStack = UIStackView(arrangedSubviews: [maxAgeLabel, maxAgeSlider])
        minStack.spacing = 24
        maxAgeLabel.text = "Max: 60"
        
        sliderStack.addArrangedSubview(minStack)
        sliderStack.addArrangedSubview(maxStack)
//        let sliderStack = UIStackView(arrangedSubviews: [minStack, maxStack])
        sliderStack.axis = .vertical
        sliderStack.spacing = 16
        addSubview(sliderStack)
        sliderStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(-24)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let viewModel = viewModel else { return }
        inputField.isHidden = viewModel.shouldHideInputField
        sliderStack.isHidden = viewModel.shouldHideSlider
    }
    
    func createAgeRangeSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 18
        slider.maximumValue = 60
        slider.addTarget(self, action: #selector(handleAgeRangeChanged), for: .valueChanged)
        return slider
    }
    
    // MARK:- Selectors
    @objc func handleAgeRangeChanged() {
        
    }
}
