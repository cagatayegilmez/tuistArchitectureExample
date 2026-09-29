//
//  SettingsBuilder.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

enum SettingsBuilder {

    /// Builds the settings screen
    ///
    /// - Returns: Settings view controller ready to be pushed
    static func build() -> UIViewController {
        let router = SettingsRouter()
        let viewModel = SettingsViewModel(router: router)
        let viewController = SettingsViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
