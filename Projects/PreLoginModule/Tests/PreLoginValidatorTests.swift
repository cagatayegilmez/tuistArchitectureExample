//
//  PreLoginValidatorTests.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule
import Testing

struct PreLoginValidatorTests {

    /// Verifies that blank required text produces an error
    ///
    /// - Parameter text: Blank input variant
    @Test(arguments: ["", "   "])
    func requiredRejectsBlankText(text: String) {
        #expect(PreLoginValidator.validateRequired(text) != nil)
    }

    /// Verifies that non blank required text is accepted
    @Test
    func requiredAcceptsText() {
        #expect(PreLoginValidator.validateRequired("Ada") == nil)
    }

    /// Verifies that malformed e-mails produce an error
    ///
    /// - Parameter email: Malformed e-mail variant
    @Test(arguments: ["", "invalid", "user@", "@example.com", "user@example"])
    func emailRejectsMalformedInput(email: String) {
        #expect(PreLoginValidator.validateEmail(email) != nil)
    }

    /// Verifies that well formed e-mails are accepted
    ///
    /// - Parameter email: Well formed e-mail variant
    @Test(arguments: ["user@example.com", "first.last+tag@sub.example.co"])
    func emailAcceptsWellFormedInput(email: String) {
        #expect(PreLoginValidator.validateEmail(email) == nil)
    }

    /// Verifies that short passwords produce an error
    ///
    /// - Parameter password: Short password variant
    @Test(arguments: ["", "1234567"])
    func passwordRejectsShortInput(password: String) {
        #expect(PreLoginValidator.validatePassword(password) != nil)
    }

    /// Verifies that passwords with the minimum length are accepted
    @Test
    func passwordAcceptsMinimumLength() {
        #expect(PreLoginValidator.validatePassword("12345678") == nil)
    }

    /// Verifies that a mismatching confirmation produces an error
    @Test
    func confirmationRejectsMismatch() {
        #expect(PreLoginValidator.validateConfirmation("password1", matching: "password2") != nil)
    }

    /// Verifies that a matching confirmation is accepted
    @Test
    func confirmationAcceptsMatch() {
        #expect(PreLoginValidator.validateConfirmation("password1", matching: "password1") == nil)
    }
}
