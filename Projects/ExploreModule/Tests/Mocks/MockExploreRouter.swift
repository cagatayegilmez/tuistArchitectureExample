//
//  MockExploreRouter.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import ExploreModule

final class MockExploreRouter: ExploreRoutingProtocol {

    private(set) var routeToDetailCallCount = 0

    /// Records the detail route request
    func routeToDetail() {
        routeToDetailCallCount += 1
    }
}
