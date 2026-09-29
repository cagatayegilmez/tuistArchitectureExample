//
//  HomeRouter.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class HomeRouter: HomeRoutingProtocol {

    weak var viewController: UIViewController?

    /// Routes to the homeDetail screen
    func routeToDetail() {
        let detail = HomeDetailBuilder.build()
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
