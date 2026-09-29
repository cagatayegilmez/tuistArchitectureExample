//
//  MockBookmarksRouter.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import BookmarksModule

final class MockBookmarksRouter: BookmarksRoutingProtocol {

    private(set) var routeToDetailCallCount = 0

    /// Records the detail route request
    func routeToDetail() {
        routeToDetailCallCount += 1
    }
}
