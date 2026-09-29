//
//  BookmarksViewController.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

public final class BookmarksViewController: UIViewController {

    private let viewModel: BookmarksViewModelProtocol

    /// Creates the bookmarks view controller
    ///
    /// - Parameter viewModel: View model driving the bookmarks screen
    init(viewModel: BookmarksViewModelProtocol) {
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
    override public func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
    }
}
