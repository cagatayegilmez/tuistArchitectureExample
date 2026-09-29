//
//  MockRegisterRouter.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule

final class MockRegisterRouter: RegisterRoutingProtocol {

    private(set) var routeToRegisteredCallCount = 0

    /// Records the registered route request
    func routeToRegistered() {
        routeToRegisteredCallCount += 1
    }
}
