//
//  SettingsVM.swift
//  Tinder Clone
//
//  Created by Kyo on 1/24/21.
//

import UIKit

enum SettingsSections: Int, CaseIterable {
    case name
    case profession
    case age
    case bio
    case ageRange
    
    var description: String {
        switch self {
        case .name: return "Name"
        case .profession: return "Profession"
        case .age: return "Age"
        case .bio: return "Bio"
        case .ageRange: return "Seeking Age Range"
        }
    }
}

class SettingVM {
    private let user: User
    public let section: SettingsSections
    
    let placeholderText: String
    var value: String?
    
    public var shouldHideInputField: Bool {
        return section == .ageRange
    }
    
    public var shouldHideSlider: Bool {
        return section != .ageRange
    }
    
    public func minAgeLabelText(forValue value: Float) -> String {
         return "Min: \(Int(value))"
    }
    
    public func maxAgeLabelText(forValue value: Float) -> String {
         return "Max: \(Int(value))"
    }
    
    var minAgeSliderValue: Float {
//        guard let min = user.minSeekingAge else { return 18 }
        return Float(user.minSeekingAge)
    }
    
    var maxAgeSliderValue: Float {
//        guard let max = user.maxSeekingAge else { return 60 }
        return Float(user.maxSeekingAge)
    }
    
    init(user: User, section: SettingsSections) {
        self.user = user
        self.section = section
        placeholderText = "Entery \(section.description.lowercased()).."
        
        switch section {
        case .name:
            value = user.name
        case .age:
            value = "\(user.age)"
        case .profession:
            value = user.profession
        case .bio:
            value = user.bio
        case .ageRange:
            break
        }
    }
    
    
}
