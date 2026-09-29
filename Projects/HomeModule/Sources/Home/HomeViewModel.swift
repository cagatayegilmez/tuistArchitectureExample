//
//  HomeViewModel.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Home"
}

@Observable
final class HomeViewModel: HomeViewModelProtocol {

    let title = Constant.title

    private let router: any HomeRoutingProtocol

    /// Creates the home view model
    ///
    /// - Parameter router: Router handling the home screen navigation
    init(router: any HomeRoutingProtocol) {
        self.router = router
    }

    /// Handles the detail button tap
    func detailTapped() {
        router.routeToDetail()
    }
}
