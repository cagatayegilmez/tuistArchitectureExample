//
//  ExploreViewModelTests.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import ExploreModule
import Testing

struct ExploreViewModelTests {

    /// Verifies that the detail tap routes to the exploreDetail screen
    @Test
    func detailTappedRoutesToDetail() {
        let router = MockExploreRouter()
        let sut = ExploreViewModel(router: router)

        sut.detailTapped()

        #expect(router.routeToDetailCallCount == 1)
    }

    /// Verifies that the screen title is exposed to the view
    @Test
    func titleIsExposed() {
        let sut = ExploreViewModel(router: MockExploreRouter())

        #expect(sut.title == "Explore")
    }
}
