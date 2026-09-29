//
//  PreLoginCoordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import PreLoginModule
import UIKit

protocol PreLoginCoordinatorDelegate: AnyObject {

    /// Notifies that the pre-login flow authenticated the user
    ///
    /// - Parameter coordinator: Pre-login coordinator that finished
    func preLoginCoordinatorDidFinish(_ coordinator: PreLoginCoordinator)
}

final class PreLoginCoordinator: Coordinator {

    weak var delegate: (any PreLoginCoordinatorDelegate)?

    var rootViewController: UIViewController {
        navigationController
    }

    private let navigationController = ExampleNavigationController()
    private let sessionStore: any PreLoginSessionStoring

    /// Creates the pre-login coordinator
    ///
    /// - Parameter sessionStore: Session storage handed to the pre-login module
    init(sessionStore: any PreLoginSessionStoring) {
        self.sessionStore = sessionStore
    }

    /// Builds the welcome screen as the root of the pre-login navigation stack
    func start() {
        let dependencies = PreLoginDependencies(sessionStore: sessionStore, flowDelegate: self)
        let welcome = WelcomeBuilder.build(dependencies: dependencies)
        navigationController.setViewControllers([welcome], animated: false)
    }
}

extension PreLoginCoordinator: PreLoginFlowDelegate {

    /// Forwards the flow completion to the delegate
    func preLoginDidFinish() {
        delegate?.preLoginCoordinatorDidFinish(self)
    }
}
