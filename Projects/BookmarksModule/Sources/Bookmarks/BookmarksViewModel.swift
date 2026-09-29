//
//  BookmarksViewModel.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Bookmarks"
}

@Observable
final class BookmarksViewModel: BookmarksViewModelProtocol {

    let title = Constant.title

    private let router: any BookmarksRoutingProtocol

    /// Creates the bookmarks view model
    ///
    /// - Parameter router: Router handling the bookmarks screen navigation
    init(router: any BookmarksRoutingProtocol) {
        self.router = router
    }

    /// Handles the detail button tap
    func detailTapped() {
        router.routeToDetail()
    }
}
