//
//  RegisterRouter.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

final class RegisterRouter: RegisterRoutingProtocol {

    private let dependencies: PreLoginDependencies

    /// Creates the register router
    ///
    /// - Parameter dependencies: Dependencies shared across the pre-login flow
    init(dependencies: PreLoginDependencies) {
        self.dependencies = dependencies
    }

    /// Routes out of the pre-login flow after a successful registration
    func routeToRegistered() {
        dependencies.flowDelegate?.preLoginDidFinish()
    }
}
