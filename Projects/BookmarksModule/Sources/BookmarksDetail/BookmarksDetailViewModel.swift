//
//  BookmarksDetailViewModel.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Bookmarks Detail"
}

@Observable
final class BookmarksDetailViewModel: BookmarksDetailViewModelProtocol {

    let title = Constant.title

    private let router: any BookmarksDetailRoutingProtocol

    /// Creates the bookmarksDetail view model
    ///
    /// - Parameter router: Router handling the bookmarksDetail screen navigation
    init(router: any BookmarksDetailRoutingProtocol) {
        self.router = router
    }
}
