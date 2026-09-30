//
//  ButtonConfiguration.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import Foundation
import SwiftUI
import UIKit

/// Button type selector enum
public enum ExampleButtonType {

    /// Primary type button like sign in
    case primary
    /// Plain type button like logout
    case plain
}

/// Button configurator
public struct ExampleButtonConfiguration {

    /// Selected button type
    public let style: ExampleButtonType
    /// Provided button title
    public let title: String

    private init(style: ExampleButtonType,
                 title: String) {
        self.style = style
        self.title = title
    }

    /// Creates primary typed button
    ///
    /// - Parameter title: Title of button
    /// - Returns: Primary configured ExampleButtonConfiguration object
    public static func primary(title: String) -> Self {
        .init(style: .primary, title: title)
    }

    /// Creates plain typed button
    ///
    /// - Parameter title: Title of button
    /// - Returns: Plain configured ExampleButtonConfiguration object
    public static func plain(title: String) -> Self {
        .init(style: .plain, title: title)
    }
}

public extension ExampleButtonConfiguration {

    /// Creates a UIBarButtonItem from the button configuration
    ///
    /// - Parameter action: Button click action provider
    @MainActor
    func makeBarButtonItem(action: @escaping () -> Void) -> UIBarButtonItem {
        let item = UIBarButtonItem(
            title: title,
            primaryAction: UIAction { _ in action() }
        )
        item.tintColor = UIColor(ExampleColor.brandPrimary)

        if case .primary = style {
            assertionFailure("ExampleButtonConfiguration.primary can not be used with UIBarButtonItem.")
        }
        return item
    }
}
