//
//  WelcomeViewModelProtocol.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol WelcomeViewModelProtocol: AnyObject, Observable {

    /// Handles the login button tap
    func loginTapped()

    /// Handles the register button tap
    func registerTapped()
}
