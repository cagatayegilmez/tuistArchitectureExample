//
//  LoginRouter.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

final class LoginRouter: LoginRoutingProtocol {

    private let dependencies: PreLoginDependencies

    /// Creates the login router
    ///
    /// - Parameter dependencies: Dependencies shared across the pre-login flow
    init(dependencies: PreLoginDependencies) {
        self.dependencies = dependencies
    }

    /// Routes out of the pre-login flow after a successful login
    func routeToLoggedIn() {
        dependencies.flowDelegate?.preLoginDidFinish()
    }
}
