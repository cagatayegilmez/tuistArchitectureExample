//
//  NavigationController.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 23.09.2026.
//

import UIKit

private enum Constant {

    static let titleFont = UIFont.boldSystemFont(ofSize: 18)
}

public final class ExampleNavigationController: UINavigationController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    private func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(ExampleColor.background)
        appearance.shadowColor = nil
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(ExampleColor.textPrimary),
            .font: Constant.titleFont
        ]

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.tintColor = UIColor(ExampleColor.accentIndigo)
    }
}
