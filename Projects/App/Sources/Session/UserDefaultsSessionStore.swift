//
//  UserDefaultsSessionStore.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

private enum Constant {

    static let isLoggedInKey = "isLoggedIn"
}

final class UserDefaultsSessionStore: AppSessionStoring {

    private let defaults: UserDefaults

    var isLoggedIn: Bool {
        defaults.bool(forKey: Constant.isLoggedInKey)
    }

    /// Creates the user defaults backed session store
    ///
    /// - Parameter defaults: User defaults instance used as persistence
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    /// Persists the logged in state after a successful authentication
    func markLoggedIn() {
        defaults.set(true, forKey: Constant.isLoggedInKey)
    }

    /// Clears the logged in state after the user logs out
    func markLoggedOut() {
        defaults.set(false, forKey: Constant.isLoggedInKey)
    }
}
