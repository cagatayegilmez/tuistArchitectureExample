//
//  WelcomeViewModel.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

@Observable
final class WelcomeViewModel: WelcomeViewModelProtocol {

    private let router: any WelcomeRoutingProtocol

    /// Creates the welcome view model
    ///
    /// - Parameter router: Router handling the welcome screen navigation
    init(router: any WelcomeRoutingProtocol) {
        self.router = router
    }

    /// Handles the login button tap
    func loginTapped() {
        router.routeToLogin()
    }

    /// Handles the register button tap
    func registerTapped() {
        router.routeToRegister()
    }
}
