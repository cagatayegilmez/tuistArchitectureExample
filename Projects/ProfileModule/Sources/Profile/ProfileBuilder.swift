//
//  ProfileBuilder.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

/// Entry point builder of the profile tab
public enum ProfileBuilder {

    /// Builds the profile screen which is the root of the profile tab
    ///
    /// - Parameter dependencies: Dependencies shared across the profile tab
    /// - Returns: Profile view controller ready to be shown in a navigation stack
    public static func build(dependencies: ProfileDependencies) -> UIViewController {
        let router = ProfileRouter(dependencies: dependencies)
        let viewModel = ProfileViewModel(router: router, sessionStore: dependencies.sessionStore)
        let viewController = ProfileViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
