//
//  WelcomeRoutingProtocol.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

protocol WelcomeRoutingProtocol: AnyObject {

    /// Routes to the login screen
    func routeToLogin()

    /// Routes to the register screen
    func routeToRegister()
}
