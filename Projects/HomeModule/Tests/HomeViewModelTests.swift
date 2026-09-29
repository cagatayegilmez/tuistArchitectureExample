//
//  HomeViewModelTests.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import HomeModule
import Testing

struct HomeViewModelTests {

    /// Verifies that the detail tap routes to the homeDetail screen
    @Test
    func detailTappedRoutesToDetail() {
        let router = MockHomeRouter()
        let sut = HomeViewModel(router: router)

        sut.detailTapped()

        #expect(router.routeToDetailCallCount == 1)
    }

    /// Verifies that the screen title is exposed to the view
    @Test
    func titleIsExposed() {
        let sut = HomeViewModel(router: MockHomeRouter())

        #expect(sut.title == "Home")
    }
}
