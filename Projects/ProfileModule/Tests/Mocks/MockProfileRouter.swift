//
//  MockProfileRouter.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import ProfileModule

final class MockProfileRouter: ProfileRoutingProtocol {

    private(set) var routeToSettingsCallCount = 0
    private(set) var routeToLoggedOutCallCount = 0

    /// Records the settings route request
    func routeToSettings() {
        routeToSettingsCallCount += 1
    }

    /// Records the logged out route request
    func routeToLoggedOut() {
        routeToLoggedOutCallCount += 1
    }
}
