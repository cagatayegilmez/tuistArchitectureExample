//
//  AppCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

private enum Constant {

    static let transitionDuration: TimeInterval = 0.3
}

final class AppCoordinator {

    private let window: UIWindow
    private let sessionStore: any AppSessionStoring
    private var flowCoordinator: (any Coordinator)?

    /// Creates the application coordinator
    ///
    /// - Parameters:
    ///   - window: Window whose root view controller is driven by the coordinator
    ///   - sessionStore: Session storage deciding which flow is shown
    init(window: UIWindow,
         sessionStore: any AppSessionStoring) {
        self.window = window
        self.sessionStore = sessionStore
    }

    /// Shows the flow matching the persisted session state and makes the window visible
    func start() {
        if sessionStore.isLoggedIn {
            showMainTabBar(animated: false)
        } else {
            showPreLogin(animated: false)
        }
        window.makeKeyAndVisible()
    }

    /// Replaces the window root with the pre-login flow
    ///
    /// - Parameter animated: Whether the root replacement is cross dissolved
    private func showPreLogin(animated: Bool) {
        let coordinator = PreLoginCoordinator(sessionStore: sessionStore)
        coordinator.delegate = self
        setFlow(coordinator, animated: animated)
    }

    /// Replaces the window root with the main tab bar flow
    ///
    /// - Parameter animated: Whether the root replacement is cross dissolved
    private func showMainTabBar(animated: Bool) {
        let coordinator = MainTabBarCoordinator(sessionStore: sessionStore)
        coordinator.delegate = self
        setFlow(coordinator, animated: animated)
    }

    /// Starts the given flow and installs it as the window root
    ///
    /// - Parameters:
    ///   - coordinator: Flow coordinator to install
    ///   - animated: Whether the root replacement is cross dissolved
    private func setFlow(_ coordinator: any Coordinator, animated: Bool) {
        coordinator.start()
        flowCoordinator = coordinator
        window.rootViewController = coordinator.rootViewController
        guard animated else {
            return
        }

        UIView.transition(with: window,
                          duration: Constant.transitionDuration,
                          options: .transitionCrossDissolve,
                          animations: nil)
    }
}

extension AppCoordinator: PreLoginCoordinatorDelegate {

    /// Switches to the main tab bar flow once the user is authenticated
    ///
    /// - Parameter coordinator: Pre-login coordinator that finished
    func preLoginCoordinatorDidFinish(_ coordinator: PreLoginCoordinator) {
        showMainTabBar(animated: true)
    }
}

extension AppCoordinator: MainTabBarCoordinatorDelegate {

    /// Switches back to the pre-login flow once the user logs out
    ///
    /// - Parameter coordinator: Main tab bar coordinator that reported the logout
    func mainTabBarCoordinatorDidLogout(_ coordinator: MainTabBarCoordinator) {
        showPreLogin(animated: true)
    }
}
