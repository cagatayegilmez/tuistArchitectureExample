//
//  SettingsViewController.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

final class SettingsViewController<ViewModel: SettingsViewModelProtocol>: UIViewController {

    private let viewModel: ViewModel

    /// Creates the settings view controller
    ///
    /// - Parameter viewModel: View model driving the settings screen
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
        title = viewModel.title
        addSwiftUIView(SettingsView(viewModel: viewModel), hasNavBar: true)
    }
}
