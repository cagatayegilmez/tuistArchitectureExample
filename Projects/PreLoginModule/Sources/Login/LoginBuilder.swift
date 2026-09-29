//
//  LoginBuilder.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

enum LoginBuilder {

    /// Builds the login screen
    ///
    /// - Parameter dependencies: Dependencies shared across the pre-login flow
    /// - Returns: Login view controller ready to be pushed
    static func build(dependencies: PreLoginDependencies) -> UIViewController {
        let router = LoginRouter(dependencies: dependencies)
        let viewModel = LoginViewModel(router: router, sessionStore: dependencies.sessionStore)
        let viewController = LoginViewController(viewModel: viewModel)
        viewModel.loader = viewController
        return viewController
    }
}
