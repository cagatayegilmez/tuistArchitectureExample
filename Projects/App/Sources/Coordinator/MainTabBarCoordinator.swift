//
//  MainTabBarCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import ProfileModule
import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {

    /// Notifies that the user logged out from the main tab bar flow
    ///
    /// - Parameter coordinator: Main tab bar coordinator that reported the logout
    func mainTabBarCoordinatorDidLogout(_ coordinator: MainTabBarCoordinator)
}

final class MainTabBarCoordinator: Coordinator {

    weak var delegate: (any MainTabBarCoordinatorDelegate)?

    var rootViewController: UIViewController {
        tabBarController
    }

    private let tabBarController = MainTabBarController()
    private let sessionStore: any ProfileSessionStoring
    private var tabCoordinators: [any Coordinator] = []

    /// Creates the main tab bar coordinator
    ///
    /// - Parameter sessionStore: Session storage handed to the profile module
    init(sessionStore: any ProfileSessionStoring) {
        self.sessionStore = sessionStore
    }

    /// Starts every tab coordinator and installs their roots into the tab bar
    func start() {
        let profileCoordinator = ProfileCoordinator(sessionStore: sessionStore)
        profileCoordinator.delegate = self
        tabCoordinators = [
            HomeCoordinator(),
            ExploreCoordinator(),
            BookmarksCoordinator(),
            profileCoordinator
        ]
        tabCoordinators.forEach { $0.start() }
        tabBarController.setViewControllers(tabCoordinators.map(\.rootViewController), animated: false)
    }
}

extension MainTabBarCoordinator: ProfileCoordinatorDelegate {

    /// Forwards the logout to the delegate
    ///
    /// - Parameter coordinator: Profile coordinator that reported the logout
    func profileCoordinatorDidLogout(_ coordinator: ProfileCoordinator) {
        delegate?.mainTabBarCoordinatorDidLogout(self)
    }
}
