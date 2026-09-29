//
//  BookmarksDetailBuilder.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

enum BookmarksDetailBuilder {

    /// Builds the bookmarksDetail screen
    ///
    /// - Returns: BookmarksDetail view controller ready to be pushed
    static func build() -> UIViewController {
        let router = BookmarksDetailRouter()
        let viewModel = BookmarksDetailViewModel(router: router)
        let viewController = BookmarksDetailViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
