//
//  RegisterBuilder.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

enum RegisterBuilder {

    /// Builds the register screen
    ///
    /// - Parameter dependencies: Dependencies shared across the pre-login flow
    /// - Returns: Register view controller ready to be pushed
    static func build(dependencies: PreLoginDependencies) -> RegisterViewController {
        let router = RegisterRouter(dependencies: dependencies)
        let viewModel = RegisterViewModel(router: router, sessionStore: dependencies.sessionStore)
        let viewController = RegisterViewController(viewModel: viewModel)
        let view = RegisterView(viewModel: viewModel)
        viewController.addSwiftUIView(view, hasNavBar: true)
        viewModel.loader = viewController
        return viewController
    }
}
