//
//  LoginViewController.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

private enum Constant {

    static let title = "Login"
}

final class LoginViewController<ViewModel: LoginViewModelProtocol>: UIViewController {

    private let viewModel: ViewModel

    /// Creates the login view controller
    ///
    /// - Parameter viewModel: View model driving the login screen
    init(viewModel: ViewModel) {
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

    /// Embeds the SwiftUI content once the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constant.title
        addSwiftUIView(LoginView(viewModel: viewModel), hasNavBar: true)
    }
}
