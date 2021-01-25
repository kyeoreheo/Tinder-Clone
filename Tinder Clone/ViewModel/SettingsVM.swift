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
    private let section: SettingsSections
    
    public var shouldHideInputField: Bool {
        return section == .ageRange
    }
    
    public var shouldHideSlider: Bool {
        return section != .ageRange
    }
    
    init(user: User, section: SettingsSections) {
        self.user = user
        self.section = section
    }
    
    
}
