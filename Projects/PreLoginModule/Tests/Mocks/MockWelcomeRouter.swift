//
//  MockWelcomeRouter.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule

final class MockWelcomeRouter: WelcomeRoutingProtocol {

    private(set) var routeToLoginCallCount = 0
    private(set) var routeToRegisterCallCount = 0

    /// Records the login route request
    func routeToLogin() {
        routeToLoginCallCount += 1
    }

    /// Records the register route request
    func routeToRegister() {
        routeToRegisterCallCount += 1
    }
}
