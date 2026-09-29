//
//  ExploreRouter.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class ExploreRouter: ExploreRoutingProtocol {

    weak var viewController: UIViewController?

    /// Routes to the exploreDetail screen
    func routeToDetail() {
        let detail = ExploreDetailBuilder.build()
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
