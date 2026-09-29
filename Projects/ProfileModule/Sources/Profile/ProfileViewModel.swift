//
//  ProfileViewModel.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Profile"
}

@Observable
final class ProfileViewModel: ProfileViewModelProtocol {

    let title = Constant.title

    private let router: any ProfileRoutingProtocol
    private let sessionStore: any ProfileSessionStoring

    /// Creates the profile view model
    ///
    /// - Parameters:
    ///   - router: Router handling the profile screen navigation
    ///   - sessionStore: Session storage used to clear the logged in state
    init(router: any ProfileRoutingProtocol,
         sessionStore: any ProfileSessionStoring) {
        self.router = router
        self.sessionStore = sessionStore
    }

    /// Handles the settings button tap
    func settingsTapped() {
        router.routeToSettings()
    }

    /// Handles the logout button tap
    func logoutTapped() {
        sessionStore.markLoggedOut()
        router.routeToLoggedOut()
    }
}
