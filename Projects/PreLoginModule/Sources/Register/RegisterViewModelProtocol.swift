//
//  RegisterViewModelProtocol.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol RegisterViewModelProtocol: AnyObject, Observable {

    var name: String { get set }
    var surname: String { get set }
    var email: String { get set }
    var password: String { get set }
    var passwordConfirmation: String { get set }
    var nameError: String? { get set }
    var surnameError: String? { get set }
    var emailError: String? { get set }
    var passwordError: String? { get set }
    var passwordConfirmationError: String? { get set }

    /// Validates the form and performs the registration when it is valid
    func register() async
}
