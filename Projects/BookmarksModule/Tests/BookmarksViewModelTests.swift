//
//  BookmarksViewModelTests.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import BookmarksModule
import Testing

struct BookmarksViewModelTests {

    /// Verifies that the detail tap routes to the bookmarksDetail screen
    @Test
    func detailTappedRoutesToDetail() {
        let router = MockBookmarksRouter()
        let sut = BookmarksViewModel(router: router)

        sut.detailTapped()

        #expect(router.routeToDetailCallCount == 1)
    }

    /// Verifies that the screen title is exposed to the view
    @Test
    func titleIsExposed() {
        let sut = BookmarksViewModel(router: MockBookmarksRouter())

        #expect(sut.title == "Bookmarks")
    }
}
