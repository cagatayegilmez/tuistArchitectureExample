//
//  BookmarksRouter.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class BookmarksRouter: BookmarksRoutingProtocol {

    weak var viewController: UIViewController?

    /// Routes to the bookmarksDetail screen
    func routeToDetail() {
        let detail = BookmarksDetailBuilder.build()
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
