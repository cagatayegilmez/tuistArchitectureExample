//
//  RegisterView.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Components
import DesignSystem
import SwiftUI

private enum Constant {

    static let registerTitle = "Register"
    static let namePlaceholder = "Name"
    static let surnamePlaceholder = "Surname"
    static let confirmPasswordPlaceholder = "Confirm password"
    static let fieldSpacing: CGFloat = .spacing350
    static let horizontalPadding: CGFloat = .spacing800
    static let topPadding: CGFloat = .spacing800
}

struct RegisterView<ViewModel: RegisterViewModelProtocol>: View {

    @Bindable private var viewModel: ViewModel

    /// Creates the register view
    ///
    /// - Parameter viewModel: View model driving the register screen
    init(viewModel: ViewModel) {
        self._viewModel = Bindable(viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: Constant.fieldSpacing) {
                ExampleTextInput(text: $viewModel.name,
                                 error: $viewModel.nameError,
                                 configuration: .text(placeholder: Constant.namePlaceholder))
                ExampleTextInput(text: $viewModel.surname,
                                 error: $viewModel.surnameError,
                                 configuration: .text(placeholder: Constant.surnamePlaceholder))
                ExampleTextInput(text: $viewModel.email,
                                 error: $viewModel.emailError,
                                 configuration: .email())
                ExampleTextInput(text: $viewModel.password,
                                 error: $viewModel.passwordError,
                                 configuration: .password())
                ExampleTextInput(text: $viewModel.passwordConfirmation,
                                 error: $viewModel.passwordConfirmationError,
                                 configuration: .password(placeholder: Constant.confirmPasswordPlaceholder))
                ExampleButton(configuration: .primary(title: Constant.registerTitle)) {
                    Task {
                        await viewModel.register()
                    }
                }
            }
            .padding(.horizontal, Constant.horizontalPadding)
            .padding(.top, Constant.topPadding)
        }
        .scrollDismissesKeyboard(.interactively)
        .background(ExampleColor.background)
    }
}
