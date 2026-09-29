//
//  MockPreLoginSessionStore.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule

final class MockPreLoginSessionStore: PreLoginSessionStoring {

    private(set) var markLoggedInCallCount = 0

    /// Records the logged in mark request
    func markLoggedIn() {
        markLoggedInCallCount += 1
    }
}
