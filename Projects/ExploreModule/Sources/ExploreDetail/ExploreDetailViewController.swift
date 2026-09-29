//
//  ExploreDetailViewController.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class ExploreDetailViewController: UIViewController {

    private let viewModel: ExploreDetailViewModelProtocol

    /// Creates the exploreDetail view controller
    ///
    /// - Parameter viewModel: View model driving the exploreDetail screen
    init(viewModel: ExploreDetailViewModelProtocol) {
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
