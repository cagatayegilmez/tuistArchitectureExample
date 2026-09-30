//
//  Segment+Previews.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import SwiftUI

@MainActor
private enum DemoSegments {

    static let all = ExampleSegmentItem(id: UUID(), title: "All")
    static let recent = ExampleSegmentItem(id: UUID(), title: "Recent")
    static let popular = ExampleSegmentItem(id: UUID(), title: "Popular")
    static let saved = ExampleSegmentItem(id: UUID(), title: "Saved")
    static let allItems: [ExampleSegmentItem] = [all,
                                                 recent,
                                                 popular,
                                                 saved]
}

#Preview("Segment Demo") {
    struct SegmentPreview: View {
        @State private var selection = DemoSegments.all.id

        private var selectedTitle: String {
            DemoSegments.allItems.first { $0.id == selection }?.title ?? ""
        }

        var body: some View {
            VStack(spacing: 16) {
                ExampleSegment(
                    selection: $selection,
                    configuration: .segments(DemoSegments.allItems)
                )

                Text("Selected: \(selectedTitle)")
                    .font(.textCaption)
                    .foregroundStyle(ExampleColor.textPrimary)
                Spacer()
            }
            .padding(.top, 100)
            .padding(.horizontal, 16)
            .background(ExampleColor.background)
        }
    }
    return SegmentPreview()
}
