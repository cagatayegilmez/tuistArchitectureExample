//
//  WelcomeRouter.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class WelcomeRouter: WelcomeRoutingProtocol {

    weak var viewController: UIViewController?

    private let dependencies: PreLoginDependencies

    /// Creates the welcome router
    ///
    /// - Parameter dependencies: Dependencies shared across the pre-login flow
    init(dependencies: PreLoginDependencies) {
        self.dependencies = dependencies
    }

    /// Routes to the login screen
    func routeToLogin() {
        let login = LoginBuilder.build(dependencies: dependencies)
        viewController?.navigationController?.pushViewController(login, animated: true)
    }

    /// Routes to the register screen
    func routeToRegister() {
        let register = RegisterBuilder.build(dependencies: dependencies)
        viewController?.navigationController?.pushViewController(register, animated: true)
    }
}
