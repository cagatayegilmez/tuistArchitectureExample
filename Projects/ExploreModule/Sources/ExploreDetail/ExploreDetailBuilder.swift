//
//  ExploreDetailBuilder.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

enum ExploreDetailBuilder {

    /// Builds the exploreDetail screen
    ///
    /// - Returns: ExploreDetail view controller ready to be pushed
    static func build() -> UIViewController {
        let router = ExploreDetailRouter()
        let viewModel = ExploreDetailViewModel(router: router)
        let viewController = ExploreDetailViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
