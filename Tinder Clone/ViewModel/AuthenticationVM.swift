//
//  LogInVM.swift
//  Tinder Clone
//
//  Created by Kyo on 1/23/21.
//

import Foundation

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
    
    var formIsValid: Bool {
        return !email.isEmpty && !password.isEmpty && !fullName.isEmpty
    }
}
