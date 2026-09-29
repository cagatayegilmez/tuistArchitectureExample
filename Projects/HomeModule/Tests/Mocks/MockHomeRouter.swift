//
//  MockHomeRouter.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import HomeModule

final class MockHomeRouter: HomeRoutingProtocol {

    private(set) var routeToDetailCallCount = 0

    /// Records the detail route request
    func routeToDetail() {
        routeToDetailCallCount += 1
    }
}
