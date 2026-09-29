//
//  WelcomeViewModelTests.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule
import Testing

struct WelcomeViewModelTests {

    /// Verifies that the login tap routes to the login screen
    @Test
    func loginTappedRoutesToLogin() {
        let router = MockWelcomeRouter()
        let sut = WelcomeViewModel(router: router)

        sut.loginTapped()

        #expect(router.routeToLoginCallCount == 1)
        #expect(router.routeToRegisterCallCount == 0)
    }

    /// Verifies that the register tap routes to the register screen
    @Test
    func registerTappedRoutesToRegister() {
        let router = MockWelcomeRouter()
        let sut = WelcomeViewModel(router: router)

        sut.registerTapped()

        #expect(router.routeToRegisterCallCount == 1)
        #expect(router.routeToLoginCallCount == 0)
    }
}
