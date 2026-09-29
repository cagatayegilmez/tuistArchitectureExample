//
//  ExploreCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import ExploreModule
import UIKit

final class ExploreCoordinator: Coordinator {

    var rootViewController: UIViewController {
        navigationController
    }

    private let navigationController = ExampleNavigationController()

    /// Builds the explore screen as the root of the explore tab navigation stack
    func start() {
        navigationController.tabBarItem = MainTab.explore.tabBarItem
        navigationController.setViewControllers([ExploreBuilder.build()], animated: false)
    }
}
