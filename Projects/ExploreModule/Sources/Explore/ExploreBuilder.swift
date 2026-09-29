//
//  ExploreBuilder.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

/// Entry point builder of the explore tab
public enum ExploreBuilder {

    /// Builds the explore screen which is the root of the explore tab
    ///
    /// - Returns: Explore view controller ready to be shown in a navigation stack
    public static func build() -> ExploreViewController {
        let router = ExploreRouter()
        let viewModel = ExploreViewModel(router: router)
        let viewController = ExploreViewController(viewModel: viewModel)
        let view = ExploreView(viewModel: viewModel)
        viewController.addSwiftUIView(view, hasNavBar: true)
        router.viewController = viewController
        return viewController
    }
}
