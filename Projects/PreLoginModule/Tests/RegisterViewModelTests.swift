//
//  RegisterViewModelTests.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

@testable import PreLoginModule
import Testing

struct RegisterViewModelTests {

    private let router = MockRegisterRouter()
    private let sessionStore = MockPreLoginSessionStore()

    /// Verifies that an empty form sets every field error and does not register
    @Test
    func emptyFormSetsAllErrorsWithoutRegistering() async {
        let sut = makeSut()

        await sut.register()

        #expect(sut.nameError != nil)
        #expect(sut.surnameError != nil)
        #expect(sut.emailError != nil)
        #expect(sut.passwordError != nil)
        #expect(sut.passwordConfirmationError != nil)
        #expect(sessionStore.markLoggedInCallCount == 0)
        #expect(router.routeToRegisteredCallCount == 0)
    }

    /// Verifies that a mismatching confirmation blocks the registration
    @Test
    func mismatchingConfirmationBlocksRegistration() async {
        let sut = makeValidSut()
        sut.passwordConfirmation = "different1"

        await sut.register()

        #expect(sut.passwordConfirmationError != nil)
        #expect(sessionStore.markLoggedInCallCount == 0)
        #expect(router.routeToRegisteredCallCount == 0)
    }

    /// Verifies that a valid form persists the session and leaves the flow
    @Test
    func validFormRegistersAndRoutes() async {
        let sut = makeValidSut()

        await sut.register()

        #expect(sut.nameError == nil)
        #expect(sut.surnameError == nil)
        #expect(sut.emailError == nil)
        #expect(sut.passwordError == nil)
        #expect(sut.passwordConfirmationError == nil)
        #expect(sessionStore.markLoggedInCallCount == 1)
        #expect(router.routeToRegisteredCallCount == 1)
    }

    /// Creates the system under test with a zero authentication delay
    ///
    /// - Returns: Register view model wired to the mock router and session store
    private func makeSut() -> RegisterViewModel {
        RegisterViewModel(router: router,
                          sessionStore: sessionStore,
                          authenticationDelay: .zero)
    }

    /// Creates the system under test with a completely valid form
    ///
    /// - Returns: Register view model whose fields pass validation
    private func makeValidSut() -> RegisterViewModel {
        let sut = makeSut()
        sut.name = "Ada"
        sut.surname = "Lovelace"
        sut.email = "ada@example.com"
        sut.password = "password123"
        sut.passwordConfirmation = "password123"
        return sut
    }
}
