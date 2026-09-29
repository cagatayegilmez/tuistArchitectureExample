//
//  SettingsViewModel.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Settings"
}

@Observable
final class SettingsViewModel: SettingsViewModelProtocol {

    let title = Constant.title

    private let router: any SettingsRoutingProtocol

    /// Creates the settings view model
    ///
    /// - Parameter router: Router handling the settings screen navigation
    init(router: any SettingsRoutingProtocol) {
        self.router = router
    }
}
