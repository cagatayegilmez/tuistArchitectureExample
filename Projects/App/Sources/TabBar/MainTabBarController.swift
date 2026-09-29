//
//  MainTabBarController.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import UIKit

final class MainTabBarController: UITabBarController {

    /// Applies the brand tint to the system tab bar
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(ExampleColor.brandPrimary)
    }
}
