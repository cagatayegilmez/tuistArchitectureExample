//
//  Segment.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import SwiftUI

public struct ExampleSegment: View {

    @Binding private var selection: UUID
    private let configuration: ExampleSegmentConfiguration

    public init(selection: Binding<UUID>,
                configuration: ExampleSegmentConfiguration) {
        self._selection = selection
        self.configuration = configuration
    }

    public var body: some View {
        Picker("", selection: $selection) {
            ForEach(configuration.segments, id: \.id) { segment in
                Text(segment.title)
                    .tag(segment.id)
            }
        }
        .pickerStyle(.segmented)
        .labelsHidden()
    }
}
