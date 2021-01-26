//
//  SettingCell.swift
//  Tinder Clone
//
//  Created by Kyo on 1/24/21.
//

import UIKit

protocol SettingsCellDelegate: class {
    func updateUserInfo(_ cell: SettingsCell, updateWith value: String, section: SettingsSections)
    
    func updateUserInfo(_ cell: SettingsCell, updateRange sender: UISlider)
}

class SettingsCell: UITableViewCell {
    // MARK:- Properties
    weak var delegate: SettingsCellDelegate?
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
        selectionStyle = .none
        addSubview(inputField)
        inputField.borderStyle = .none
        inputField.font = .systemFont(ofSize: 16)
        inputField.setLeftPaddingPoints(50)
        inputField.leftViewMode = .always
        inputField.backgroundColor = .white
        inputField.addTarget(self, action: #selector(textDidChange), for: .editingDidEnd)
        inputField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.left.bottom.right.equalToSuperview()
        }
        
        let minStack = UIStackView(arrangedSubviews: [minAgeLabel, minAgeSlider])
        minAgeLabel.snp.makeConstraints { $0.width.equalTo(80) }
        minStack.spacing = 24
//        minAgeLabel.text = "Min: 18"
        
        let maxStack = UIStackView(arrangedSubviews: [maxAgeLabel, maxAgeSlider])
        maxAgeLabel.snp.makeConstraints { $0.width.equalTo(80) }
        maxStack.spacing = 24
//        maxAgeLabel.text = "Max: 60"
        
        sliderStack.addArrangedSubview(minStack)
        sliderStack.addArrangedSubview(maxStack)
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
        inputField.placeholder = viewModel.placeholderText
        inputField.text = viewModel.value
        minAgeSlider.setValue(viewModel.minAgeSliderValue, animated: true)
        minAgeLabel.text = viewModel.minAgeLabelText(forValue: viewModel.minAgeSliderValue)
        maxAgeSlider.setValue(viewModel.maxAgeSliderValue, animated: true)
        maxAgeLabel.text = viewModel.maxAgeLabelText(forValue: viewModel.maxAgeSliderValue)

    }
    
    func createAgeRangeSlider() -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 18
        slider.maximumValue = 60
        slider.addTarget(self, action: #selector(handleAgeRangeChanged), for: .valueChanged)
        return slider
    }
    
    // MARK:- Selectors
    @objc func handleAgeRangeChanged(sender: UISlider) {
        if sender == minAgeSlider {
            minAgeLabel.text = viewModel?.minAgeLabelText(forValue: sender.value)
        } else {
            maxAgeLabel.text = viewModel?.maxAgeLabelText(forValue: sender.value)
        }
        delegate?.updateUserInfo(self, updateRange: sender)
    }
    
    @objc func textDidChange(sender: UITextField) {
        guard let value = sender.text,
              let viewModel = viewModel
        else { return }
        delegate?.updateUserInfo(self, updateWith: value, section: viewModel.section)
    }
}
