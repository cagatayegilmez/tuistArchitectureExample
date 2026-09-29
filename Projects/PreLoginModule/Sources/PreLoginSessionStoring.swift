//
//  PreLoginSessionStoring.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Session storage abstraction required by the pre-login flow
public protocol PreLoginSessionStoring: AnyObject {

    /// Persists the logged in state after a successful authentication
    func markLoggedIn()
}
