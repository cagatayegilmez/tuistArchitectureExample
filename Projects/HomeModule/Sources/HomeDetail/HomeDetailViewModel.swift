//
//  HomeDetailViewModel.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

private enum Constant {

    static let title = "Home Detail"
}

@Observable
final class HomeDetailViewModel: HomeDetailViewModelProtocol {

    let title = Constant.title

    private let router: any HomeDetailRoutingProtocol

    /// Creates the homeDetail view model
    ///
    /// - Parameter router: Router handling the homeDetail screen navigation
    init(router: any HomeDetailRoutingProtocol) {
        self.router = router
    }
}
