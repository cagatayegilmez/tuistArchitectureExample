//
//  ProfileViewModelTests.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import ProfileModule
import Testing

struct ProfileViewModelTests {

    private let router = MockProfileRouter()
    private let sessionStore = MockProfileSessionStore()

    /// Verifies that the settings tap routes to the settings screen without touching the session
    @Test
    func settingsTappedRoutesToSettings() {
        let sut = makeSut()

        sut.settingsTapped()

        #expect(router.routeToSettingsCallCount == 1)
        #expect(router.routeToLoggedOutCallCount == 0)
        #expect(sessionStore.markLoggedOutCallCount == 0)
    }

    /// Verifies that the logout tap clears the session and leaves the flow
    @Test
    func logoutTappedClearsSessionAndRoutes() {
        let sut = makeSut()

        sut.logoutTapped()

        #expect(sessionStore.markLoggedOutCallCount == 1)
        #expect(router.routeToLoggedOutCallCount == 1)
        #expect(router.routeToSettingsCallCount == 0)
    }

    /// Creates the system under test
    ///
    /// - Returns: Profile view model wired to the mock router and session store
    private func makeSut() -> ProfileViewModel {
        ProfileViewModel(router: router, sessionStore: sessionStore)
    }
}
