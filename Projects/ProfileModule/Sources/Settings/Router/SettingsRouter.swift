//
//  SettingsRouter.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

final class SettingsRouter: SettingsRoutingProtocol {

    weak var viewController: UIViewController?

    /// Routes back to the previous screen
    func routeBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
