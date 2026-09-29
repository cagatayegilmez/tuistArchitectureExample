//
//  LoginViewModel.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import Observation

private enum Constant {

    static let defaultAuthenticationDelay: Duration = .seconds(1)
}

@Observable
final class LoginViewModel: LoginViewModelProtocol {

    var email = ""
    var password = ""
    var emailError: String?
    var passwordError: String?
    @ObservationIgnored weak var loader: (any SwiftUILoaderProtocol)?

    private let router: any LoginRoutingProtocol
    private let sessionStore: any PreLoginSessionStoring
    private let authenticationDelay: Duration

    /// Creates the login view model
    ///
    /// - Parameters:
    ///   - router: Router handling the login screen navigation
    ///   - sessionStore: Session storage used to persist the logged in state
    ///   - authenticationDelay: Simulated duration of the authentication request
    init(router: any LoginRoutingProtocol,
         sessionStore: any PreLoginSessionStoring,
         authenticationDelay: Duration = Constant.defaultAuthenticationDelay) {
        self.router = router
        self.sessionStore = sessionStore
        self.authenticationDelay = authenticationDelay
    }

    /// Validates the credentials and performs the login when they are valid
    func login() async {
        emailError = PreLoginValidator.validateEmail(email)
        passwordError = PreLoginValidator.validatePassword(password)
        guard emailError == nil, passwordError == nil else {
            return
        }

        loader?.toggleLoading(isLoading: true)
        try? await Task.sleep(for: authenticationDelay)
        loader?.toggleLoading(isLoading: false)
        sessionStore.markLoggedIn()
        router.routeToLoggedIn()
    }
}
