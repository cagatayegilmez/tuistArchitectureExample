//
//  BookmarksCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import BookmarksModule
import DesignSystem
import UIKit

final class BookmarksCoordinator: Coordinator {

    var rootViewController: UIViewController {
        navigationController
    }

    private let navigationController = ExampleNavigationController()

    /// Builds the bookmarks screen as the root of the bookmarks tab navigation stack
    func start() {
        navigationController.tabBarItem = MainTab.bookmarks.tabBarItem
        navigationController.setViewControllers([BookmarksBuilder.build()], animated: false)
    }
}
