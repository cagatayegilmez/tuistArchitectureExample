//
//  Segment+Previews.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import DesignSystem
import SwiftUI

@MainActor
private enum LoanFilterSegments {

    static let all = ExampleSegmentItem(id: UUID(), title: "All")
    static let active = ExampleSegmentItem(id: UUID(), title: "Active")
    static let overdue = ExampleSegmentItem(id: UUID(), title: "Overdue")
    static let defaulted = ExampleSegmentItem(id: UUID(), title: "Default")
    static let paid = ExampleSegmentItem(id: UUID(), title: "Paid")
    static let allItems: [ExampleSegmentItem] = [all,
                                                 active,
                                                 overdue,
                                                 defaulted,
                                                 paid]
}

#Preview("Segment Demo") {
    struct SegmentPreview: View {
        @State private var selection = LoanFilterSegments.all.id

        private var selectedTitle: String {
            LoanFilterSegments.allItems.first { $0.id == selection }?.title ?? ""
        }

        var body: some View {
            VStack(spacing: 16) {
                ExampleSegment(
                    selection: $selection,
                    configuration: .segments(LoanFilterSegments.allItems)
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

