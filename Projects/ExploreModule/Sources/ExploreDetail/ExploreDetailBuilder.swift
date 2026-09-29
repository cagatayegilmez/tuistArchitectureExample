//
//  ExploreDetailBuilder.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

enum ExploreDetailBuilder {

    /// Builds the exploreDetail screen
    ///
    /// - Returns: ExploreDetail view controller ready to be pushed
    static func build() -> ExploreDetailViewController {
        let router = ExploreDetailRouter()
        let viewModel = ExploreDetailViewModel(router: router)
        let viewController = ExploreDetailViewController(viewModel: viewModel)
        let view = ExploreDetailView(viewModel: viewModel)
        viewController.addSwiftUIView(view, hasNavBar: true)
        router.viewController = viewController
        return viewController
    }
}
