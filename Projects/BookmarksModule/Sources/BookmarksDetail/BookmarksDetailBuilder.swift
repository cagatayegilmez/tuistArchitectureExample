//
//  BookmarksDetailBuilder.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

enum BookmarksDetailBuilder {

    /// Builds the bookmarksDetail screen
    ///
    /// - Returns: BookmarksDetail view controller ready to be pushed
    static func build() -> BookmarksDetailViewController {
        let router = BookmarksDetailRouter()
        let viewModel = BookmarksDetailViewModel(router: router)
        let viewController = BookmarksDetailViewController(viewModel: viewModel)
        let view = BookmarksDetailView(viewModel: viewModel)
        viewController.addSwiftUIView(view, hasNavBar: true)
        router.viewController = viewController
        return viewController
    }
}
