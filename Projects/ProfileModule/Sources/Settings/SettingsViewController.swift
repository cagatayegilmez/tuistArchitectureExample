//
//  SettingsViewController.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class SettingsViewController: UIViewController {

    private let viewModel: SettingsViewModelProtocol

    /// Creates the settings view controller
    ///
    /// - Parameter viewModel: View model driving the settings screen
    init(viewModel: SettingsViewModelProtocol) {
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
        title = viewModel.title
    }
}
