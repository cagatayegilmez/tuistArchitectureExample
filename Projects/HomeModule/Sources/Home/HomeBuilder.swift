//
//  HomeBuilder.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

/// Entry point builder of the home tab
public enum HomeBuilder {

    /// Builds the home screen which is the root of the home tab
    ///
    /// - Returns: Home view controller ready to be shown in a navigation stack
    public static func build() -> UIViewController {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
