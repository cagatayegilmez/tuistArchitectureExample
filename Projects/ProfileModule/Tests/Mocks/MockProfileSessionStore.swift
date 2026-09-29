//
//  MockProfileSessionStore.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import ProfileModule

final class MockProfileSessionStore: ProfileSessionStoring {

    private(set) var markLoggedOutCallCount = 0

    /// Records the logged out mark request
    func markLoggedOut() {
        markLoggedOutCallCount += 1
    }
}
