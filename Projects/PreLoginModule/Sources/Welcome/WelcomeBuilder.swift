//
//  WelcomeBuilder.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

/// Entry point builder of the pre-login flow
public enum WelcomeBuilder {

    /// Builds the welcome screen which is the entry point of the pre-login flow
    ///
    /// - Parameter dependencies: Dependencies shared across the pre-login flow
    /// - Returns: Welcome view controller ready to be shown in a navigation stack
    public static func build(dependencies: PreLoginDependencies) -> UIViewController {
        let router = WelcomeRouter(dependencies: dependencies)
        let viewModel = WelcomeViewModel(router: router)
        let viewController = WelcomeViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
