//
//  LoginRoutingProtocol.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

protocol LoginRoutingProtocol: AnyObject {

    /// Routes out of the pre-login flow after a successful login
    func routeToLoggedIn()
}
