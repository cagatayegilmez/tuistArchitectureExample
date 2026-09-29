//
//  WelcomeView.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Components
import DesignSystem
import SwiftUI

private enum Constant {

    static let logoSystemName = "cube.transparent"
    static let logoSize: CGFloat = .spacing2500
    static let loginTitle = "Login"
    static let registerTitle = "Register"
    static let buttonSpacing: CGFloat = .spacing350
    static let horizontalPadding: CGFloat = .spacing800
    static let bottomPadding: CGFloat = .spacing1000
}

struct WelcomeView<ViewModel: WelcomeViewModelProtocol>: View {

    private let viewModel: ViewModel

    /// Creates the welcome view
    ///
    /// - Parameter viewModel: View model driving the welcome screen
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: Constant.buttonSpacing) {
            Spacer()
            Image(systemName: Constant.logoSystemName)
                .resizable()
                .scaledToFit()
                .frame(width: Constant.logoSize, height: Constant.logoSize)
                .foregroundStyle(ExampleColor.brandPrimary)
            Spacer()
            ExampleButton(configuration: .primary(title: Constant.loginTitle)) {
                viewModel.loginTapped()
            }
            ExampleButton(configuration: .plain(title: Constant.registerTitle)) {
                viewModel.registerTapped()
            }
        }
        .padding(.horizontal, Constant.horizontalPadding)
        .padding(.bottom, Constant.bottomPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ExampleColor.background)
    }
}
