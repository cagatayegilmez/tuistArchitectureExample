//
//  ProfileCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import ProfileModule
import UIKit

protocol ProfileCoordinatorDelegate: AnyObject {

    /// Notifies that the user logged out from the profile tab
    ///
    /// - Parameter coordinator: Profile coordinator that reported the logout
    func profileCoordinatorDidLogout(_ coordinator: ProfileCoordinator)
}

final class ProfileCoordinator: Coordinator {

    weak var delegate: (any ProfileCoordinatorDelegate)?

    var rootViewController: UIViewController {
        navigationController
    }

    private let navigationController = ExampleNavigationController()
    private let sessionStore: any ProfileSessionStoring

    /// Creates the profile coordinator
    ///
    /// - Parameter sessionStore: Session storage handed to the profile module
    init(sessionStore: any ProfileSessionStoring) {
        self.sessionStore = sessionStore
    }

    /// Builds the profile screen as the root of the profile tab navigation stack
    func start() {
        let dependencies = ProfileDependencies(sessionStore: sessionStore, flowDelegate: self)
        navigationController.tabBarItem = MainTab.profile.tabBarItem
        navigationController.setViewControllers([ProfileBuilder.build(dependencies: dependencies)], animated: false)
    }
}

extension ProfileCoordinator: ProfileFlowDelegate {

    /// Forwards the logout to the delegate
    func profileDidLogout() {
        delegate?.profileCoordinatorDidLogout(self)
    }
}
