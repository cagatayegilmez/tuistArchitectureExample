//
//  HomeDetailView.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import SwiftUI

struct HomeDetailView<ViewModel: HomeDetailViewModelProtocol>: View {

    private let viewModel: ViewModel

    /// Creates the homeDetail view
    ///
    /// - Parameter viewModel: View model driving the homeDetail screen
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(viewModel.title)
            .font(.heroTitle)
            .foregroundStyle(ExampleColor.textPrimary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ExampleColor.background)
    }
}
