//
//  BookmarksBuilder.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

/// Entry point builder of the bookmarks tab
public enum BookmarksBuilder {

    /// Builds the bookmarks screen which is the root of the bookmarks tab
    ///
    /// - Returns: Bookmarks view controller ready to be shown in a navigation stack
    public static func build() -> UIViewController {
        let router = BookmarksRouter()
        let viewModel = BookmarksViewModel(router: router)
        let viewController = BookmarksViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
