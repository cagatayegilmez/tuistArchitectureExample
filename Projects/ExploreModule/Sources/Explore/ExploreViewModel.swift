//
//  ExploreViewModel.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Explore"
}

@Observable
final class ExploreViewModel: ExploreViewModelProtocol {

    let title = Constant.title

    private let router: any ExploreRoutingProtocol

    /// Creates the explore view model
    ///
    /// - Parameter router: Router handling the explore screen navigation
    init(router: any ExploreRoutingProtocol) {
        self.router = router
    }

    /// Handles the detail button tap
    func detailTapped() {
        router.routeToDetail()
    }
}
