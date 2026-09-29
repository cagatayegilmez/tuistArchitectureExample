//
//  ExploreView.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Components
import DesignSystem
import SwiftUI

private enum Constant {

    static let detailButtonTitle = "Show Detail"
    static let contentSpacing: CGFloat = .spacing600
    static let horizontalPadding: CGFloat = .spacing800
}

struct ExploreView<ViewModel: ExploreViewModelProtocol>: View {

    private let viewModel: ViewModel

    /// Creates the explore view
    ///
    /// - Parameter viewModel: View model driving the explore screen
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: Constant.contentSpacing) {
            Spacer()
            Text(viewModel.title)
                .font(.heroTitle)
                .foregroundStyle(ExampleColor.textPrimary)
            ExampleButton(configuration: .primary(title: Constant.detailButtonTitle)) {
                viewModel.detailTapped()
            }
            Spacer()
        }
        .padding(.horizontal, Constant.horizontalPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(ExampleColor.background)
    }
}
