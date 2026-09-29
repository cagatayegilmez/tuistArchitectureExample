//
//  MockLoginRouter.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule

final class MockLoginRouter: LoginRoutingProtocol {

    private(set) var routeToLoggedInCallCount = 0

    /// Records the logged in route request
    func routeToLoggedIn() {
        routeToLoggedInCallCount += 1
    }
}
