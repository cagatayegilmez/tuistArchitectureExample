//
//  TextInputConfiguration.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import SwiftUI

/// Type of text input style
public enum ExampleInputType {

    /// Plain text input field
    case text
    /// Email input field
    case email
    /// Password input field
    case password
    /// Amount entry input field
    case amount(maxFractionDigits: Int)
}

/// Text input configuration
public struct ExampleTextInputConfiguration {

    /// Type of text input
    public let type: ExampleInputType
    /// Placeholder text
    public let placeholder: String

    private init(type: ExampleInputType,
                 placeholder: String) {
        self.type = type
        self.placeholder = placeholder
    }

    /// Creates plain text input field
    ///
    /// - Parameter placeholder: Input field's placeholder string
    /// - Returns: Text configurated ExampleTextInputConfiguration object
    public static func text(placeholder: String) -> Self {
        .init(type: .text, placeholder: placeholder)
    }

    /// Creates email input field
    ///
    /// - Parameter placeholder: Input field's placeholder string
    /// - Returns: Email configurated KLTextInputConfiguration object
    public static func email(placeholder: String = "E-mail address") -> Self {
        .init(type: .email, placeholder: placeholder)
    }

    /// Creates password input field
    ///
    /// - Parameter placeholder: Input field's placeholder string
    /// - Returns: Password configurated KLTextInputConfiguration object
    public static func password(placeholder: String = "Password") -> Self {
        .init(type: .password, placeholder: placeholder)
    }

    /// Creates amount entry input field
    ///
    /// - Parameters:
    ///  - placeholder: Input field's placeholder string
    ///  - maxFractionDigits: Digit counts for user can type maximum characters after comma
    /// - Returns: Email configurated KLTextInputConfiguration object
    public static func amount(placeholder: String = "0.00",
                              maxFractionDigits: Int = 2) -> Self {
        .init(type: .amount(maxFractionDigits: maxFractionDigits),
              placeholder: placeholder)
    }
}

extension ExampleTextInputConfiguration {

    /// Defines is input field must be secured
    var isSecure: Bool {
        if case .password = type {
            return true
        }

        return false
    }

    /// Defines input field's keyboard type
    var keyboardType: UIKeyboardType {
        switch type {
        case .text, .password:
            return .default
        case .email:
            return .emailAddress
        case .amount:
            return .decimalPad
        }
    }

    /// Defines input field's content type for suggestions
    var contentType: UITextContentType? {
        switch type {
        case .email:
            return .emailAddress
        case .password:
            return .password
        case .text, .amount:
            return nil
        }
    }

    /// Defines input field's autocapitalization behaviour
    var autocapitalization: TextInputAutocapitalization {
        switch type {
        case .text:
            return .words
        case .email, .password, .amount:
            return .never
        }
    }

    /// Formats input amount string to formatted amount
    ///
    /// - Parameter raw: Raw string value of input field
    /// - Returns: String value of formatted amount
    func sanitize(_ raw: String) -> String {
        guard case let .amount(maxFractionDigits) = type else {
            return raw
        }

        let normalized = raw.replacingOccurrences(of: ",", with: ".")
        var result = ""
        var hasSeparator = false
        var fractionCount = 0

        for character in normalized {
            if character.isNumber {
                if hasSeparator {
                    guard fractionCount < maxFractionDigits else {
                        continue
                    }

                    fractionCount += 1
                }
                result.append(character)
            } else if character == ".", !hasSeparator, !result.isEmpty {
                hasSeparator = true
                result.append(character)
            }
        }
        return result
    }
}
