//
//  SegmentConfiguration.swift
//  Components
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Segment item model
public struct ExampleSegmentItem {

    /// Unique id of segment item
    public let id: UUID
    /// Shown title of segment item
    public let title: String

    /// Initilization of model
    ///
    /// - Parameters:
    ///   - id: Unique id for listing items
    ///   - title: Title of showing in segment
    public init(id: UUID,
                title: String) {
        self.id = id
        self.title = title
    }
}

/// Configuration of segmented view
public struct ExampleSegmentConfiguration {

    /// Segment item list
    public let segments: [ExampleSegmentItem]

    private init(segments: [ExampleSegmentItem]) {
        self.segments = segments
    }

    /// Creates segment view configuration
    ///
    /// - Parameter segments: List of segment objects
    /// - Returns: A KLSegmentConfiguration object which contains segment items
    public static func segments(_ segments: [ExampleSegmentItem]) -> Self {
        assert(!segments.isEmpty,
               "Segment can not be created without segments.")
        assert(Set(segments.map(\.id)).count == segments.count,
               "Segment segment values must be unique.")
        return .init(segments: segments)
    }
}
