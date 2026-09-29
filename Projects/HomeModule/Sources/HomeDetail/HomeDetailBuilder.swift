//
//  HomeDetailBuilder.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

enum HomeDetailBuilder {

    /// Builds the homeDetail screen
    ///
    /// - Returns: HomeDetail view controller ready to be pushed
    static func build() -> UIViewController {
        let router = HomeDetailRouter()
        let viewModel = HomeDetailViewModel(router: router)
        let viewController = HomeDetailViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
