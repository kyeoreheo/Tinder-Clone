//
//  LogInVM.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import UIKit

protocol AuthenticationVM {
    var formIsValid: Bool { get }
}

class LogInVM: AuthenticationVM {
    var email = ""
    var password = ""
    
    var formIsValid: Bool {
        return !email.isEmpty && !password.isEmpty
    }
}

class SignInVM: AuthenticationVM {
    var email = ""
    var fullName = ""
    var password = ""
    var profileImage: UIImage? = nil
    
    var formIsValid: Bool {
        return !email.isEmpty && !password.isEmpty && !fullName.isEmpty && profileImage != nil
    }
    
    public func credentials() -> AuthCredentials? {
        if formIsValid {
            return AuthCredentials(email: email, password: password, fullName: fullName, profileImage: profileImage)
        } else {
            return nil
        }
    }
}
