//
//  LoginViewController.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

private enum Constant {

    static let title = "Login"
}

final class LoginViewController: UIViewController {

    private let viewModel: LoginViewModelProtocol

    /// Creates the login view controller
    ///
    /// - Parameter viewModel: View model driving the login screen
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    /// Unavailable storyboard initializer
    ///
    /// - Parameter coder: Unused decoder
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Sets the navigation title once the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constant.title
    }
}
