//
//  ProfileView.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Components
import DesignSystem
import SwiftUI

private enum Constant {

    static let settingsButtonTitle = "Settings"
    static let logoutButtonTitle = "Logout"
    static let contentSpacing: CGFloat = .spacing600
    static let buttonSpacing: CGFloat = .spacing350
    static let horizontalPadding: CGFloat = .spacing800
    static let bottomPadding: CGFloat = .spacing1000
}

struct ProfileView<ViewModel: ProfileViewModelProtocol>: View {

    private let viewModel: ViewModel

    /// Creates the profile view
    ///
    /// - Parameter viewModel: View model driving the profile screen
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: Constant.contentSpacing) {
            Spacer()
            Text(viewModel.title)
                .font(.heroTitle)
                .foregroundStyle(ExampleColor.textPrimary)
            ExampleButton(configuration: .primary(title: Constant.settingsButtonTitle)) {
                viewModel.settingsTapped()
            }
            Spacer()
            ExampleButton(configuration: .plain(title: Constant.logoutButtonTitle)) {
                viewModel.logoutTapped()
            }
        }
        .padding(.horizontal, Constant.horizontalPadding)
        .padding(.bottom, Constant.bottomPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ExampleColor.background)
    }
}
