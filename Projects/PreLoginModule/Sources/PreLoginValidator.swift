//
//  PreLoginValidator.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

private enum Constant {

    static let minimumPasswordLength = 8
    static let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    static let requiredMessage = "This field is required"
    static let invalidEmailMessage = "Please enter a valid e-mail address"
    static let shortPasswordMessage = "Password must be at least 8 characters"
    static let mismatchMessage = "Passwords do not match"
}

enum PreLoginValidator {

    /// Validates a required free text field such as name or surname
    ///
    /// - Parameter text: Raw text input
    /// - Returns: Error message when the text is blank, otherwise nil
    static func validateRequired(_ text: String) -> String? {
        text.trimmingCharacters(in: .whitespaces).isEmpty
        ? Constant.requiredMessage
        : nil
    }

    /// Validates an e-mail address
    ///
    /// - Parameter email: Raw e-mail input
    /// - Returns: Error message when the e-mail is blank or malformed, otherwise nil
    static func validateEmail(_ email: String) -> String? {
        let trimmed = email.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {
            return Constant.requiredMessage
        }

        guard trimmed.range(of: Constant.emailPattern, options: .regularExpression) != nil else {
            return Constant.invalidEmailMessage
        }

        return nil
    }

    /// Validates a password against the minimum length rule
    ///
    /// - Parameter password: Raw password input
    /// - Returns: Error message when the password is blank or too short, otherwise nil
    static func validatePassword(_ password: String) -> String? {
        guard !password.isEmpty else {
            return Constant.requiredMessage
        }

        guard password.count >= Constant.minimumPasswordLength else {
            return Constant.shortPasswordMessage
        }

        return nil
    }

    /// Validates that the confirmation matches the password
    ///
    /// - Parameters:
    ///   - confirmation: Raw confirmation input
    ///   - password: Password the confirmation must match
    /// - Returns: Error message when the confirmation is blank or differs, otherwise nil
    static func validateConfirmation(_ confirmation: String, matching password: String) -> String? {
        guard !confirmation.isEmpty else {
            return Constant.requiredMessage
        }

        guard confirmation == password else {
            return Constant.mismatchMessage
        }

        return nil
    }
}
