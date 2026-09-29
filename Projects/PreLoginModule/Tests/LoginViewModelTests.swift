//
//  LoginViewModelTests.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule
import Testing

struct LoginViewModelTests {

    private let router = MockLoginRouter()
    private let sessionStore = MockPreLoginSessionStore()

    /// Verifies that invalid credentials set field errors and do not authenticate
    @Test
    func invalidCredentialsSetErrorsWithoutAuthenticating() async {
        let sut = makeSut()
        sut.email = "invalid"
        sut.password = "short"

        await sut.login()

        #expect(sut.emailError != nil)
        #expect(sut.passwordError != nil)
        #expect(sessionStore.markLoggedInCallCount == 0)
        #expect(router.routeToLoggedInCallCount == 0)
    }

    /// Verifies that valid credentials persist the session and leave the flow
    @Test
    func validCredentialsAuthenticateAndRoute() async {
        let sut = makeSut()
        sut.email = "user@example.com"
        sut.password = "password123"

        await sut.login()

        #expect(sut.emailError == nil)
        #expect(sut.passwordError == nil)
        #expect(sessionStore.markLoggedInCallCount == 1)
        #expect(router.routeToLoggedInCallCount == 1)
    }

    /// Creates the system under test with a zero authentication delay
    ///
    /// - Returns: Login view model wired to the mock router and session store
    private func makeSut() -> LoginViewModel {
        LoginViewModel(router: router,
                       sessionStore: sessionStore,
                       authenticationDelay: .zero)
    }
}
