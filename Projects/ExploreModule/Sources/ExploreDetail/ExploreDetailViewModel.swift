//
//  ExploreDetailViewModel.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Explore Detail"
}

@Observable
final class ExploreDetailViewModel: ExploreDetailViewModelProtocol {

    let title = Constant.title

    private let router: any ExploreDetailRoutingProtocol

    /// Creates the exploreDetail view model
    ///
    /// - Parameter router: Router handling the exploreDetail screen navigation
    init(router: any ExploreDetailRoutingProtocol) {
        self.router = router
    }
}
