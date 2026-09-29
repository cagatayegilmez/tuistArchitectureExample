//
//  HomeCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import HomeModule
import UIKit

final class HomeCoordinator: Coordinator {

    var rootViewController: UIViewController {
        navigationController
    }

    private let navigationController = ExampleNavigationController()

    /// Builds the home screen as the root of the home tab navigation stack
    func start() {
        navigationController.tabBarItem = MainTab.home.tabBarItem
        navigationController.setViewControllers([HomeBuilder.build()], animated: false)
    }
}
