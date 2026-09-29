//
//  WelcomeViewController.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

final class WelcomeViewController<ViewModel: WelcomeViewModelProtocol>: UIViewController {

    private let viewModel: ViewModel

    /// Creates the welcome view controller
    ///
    /// - Parameter viewModel: View model driving the welcome screen
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
        addSwiftUIView(WelcomeView(viewModel: viewModel))
    }

    /// Hides the navigation bar while the welcome screen is visible
    ///
    /// - Parameter animated: Whether the appearance is animated
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    /// Restores the navigation bar when leaving the welcome screen
    ///
    /// - Parameter animated: Whether the disappearance is animated
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
