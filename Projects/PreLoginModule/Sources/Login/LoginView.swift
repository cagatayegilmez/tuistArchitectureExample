//
//  LoginView.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Components
import DesignSystem
import SwiftUI

private enum Constant {

    static let loginTitle = "Login"
    static let fieldSpacing: CGFloat = .spacing350
    static let horizontalPadding: CGFloat = .spacing800
    static let topPadding: CGFloat = .spacing800
}

struct LoginView<ViewModel: LoginViewModelProtocol>: View {

    @Bindable private var viewModel: ViewModel

    /// Creates the login view
    ///
    /// - Parameter viewModel: View model driving the login screen
    init(viewModel: ViewModel) {
        self._viewModel = Bindable(viewModel)
    }

    var body: some View {
        VStack(spacing: Constant.fieldSpacing) {
            ExampleTextInput(text: $viewModel.email,
                             error: $viewModel.emailError,
                             configuration: .email())
            ExampleTextInput(text: $viewModel.password,
                             error: $viewModel.passwordError,
                             configuration: .password())
            ExampleButton(configuration: .primary(title: Constant.loginTitle)) {
                Task {
                    await viewModel.login()
                }
            }
            Spacer()
        }
        .padding(.horizontal, Constant.horizontalPadding)
        .padding(.top, Constant.topPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ExampleColor.background)
    }
}
