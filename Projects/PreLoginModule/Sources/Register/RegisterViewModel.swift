//
//  RegisterViewModel.swift
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
final class RegisterViewModel: RegisterViewModelProtocol {

    var name = ""
    var surname = ""
    var email = ""
    var password = ""
    var passwordConfirmation = ""
    var nameError: String?
    var surnameError: String?
    var emailError: String?
    var passwordError: String?
    var passwordConfirmationError: String?
    @ObservationIgnored weak var loader: (any SwiftUILoaderProtocol)?

    private let router: any RegisterRoutingProtocol
    private let sessionStore: any PreLoginSessionStoring
    private let authenticationDelay: Duration

    private var isFormValid: Bool {
        [nameError, surnameError, emailError, passwordError, passwordConfirmationError]
            .allSatisfy { $0 == nil }
    }

    /// Creates the register view model
    ///
    /// - Parameters:
    ///   - router: Router handling the register screen navigation
    ///   - sessionStore: Session storage used to persist the logged in state
    ///   - authenticationDelay: Simulated duration of the registration request
    init(router: any RegisterRoutingProtocol,
         sessionStore: any PreLoginSessionStoring,
         authenticationDelay: Duration = Constant.defaultAuthenticationDelay) {
        self.router = router
        self.sessionStore = sessionStore
        self.authenticationDelay = authenticationDelay
    }

    /// Validates the form and performs the registration when it is valid
    func register() async {
        validate()
        guard isFormValid else {
            return
        }

        loader?.toggleLoading(isLoading: true)
        try? await Task.sleep(for: authenticationDelay)
        loader?.toggleLoading(isLoading: false)
        sessionStore.markLoggedIn()
        router.routeToRegistered()
    }

    /// Runs every field validation and stores the resulting error messages
    private func validate() {
        nameError = PreLoginValidator.validateRequired(name)
        surnameError = PreLoginValidator.validateRequired(surname)
        emailError = PreLoginValidator.validateEmail(email)
        passwordError = PreLoginValidator.validatePassword(password)
        passwordConfirmationError = PreLoginValidator.validateConfirmation(passwordConfirmation,
                                                                           matching: password)
    }
}
