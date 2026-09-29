//
//  LoginViewModelProtocol.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol LoginViewModelProtocol: AnyObject, Observable {

    var email: String { get set }
    var password: String { get set }
    var emailError: String? { get set }
    var passwordError: String? { get set }

    /// Validates the credentials and performs the login when they are valid
    func login() async
}
