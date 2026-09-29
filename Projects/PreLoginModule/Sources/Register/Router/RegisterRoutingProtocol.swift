//
//  RegisterRoutingProtocol.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

protocol RegisterRoutingProtocol: AnyObject {

    /// Routes out of the pre-login flow after a successful registration
    func routeToRegistered()
}
