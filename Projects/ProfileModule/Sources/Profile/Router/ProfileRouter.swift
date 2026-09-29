//
//  ProfileRouter.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class ProfileRouter: ProfileRoutingProtocol {

    weak var viewController: UIViewController?

    private let dependencies: ProfileDependencies

    /// Creates the profile router
    ///
    /// - Parameter dependencies: Dependencies shared across the profile tab
    init(dependencies: ProfileDependencies) {
        self.dependencies = dependencies
    }

    /// Routes to the settings screen
    func routeToSettings() {
        let settings = SettingsBuilder.build()
        viewController?.navigationController?.pushViewController(settings, animated: true)
    }

    /// Routes out of the logged in flow after the user logs out
    func routeToLoggedOut() {
        dependencies.flowDelegate?.profileDidLogout()
    }
}
