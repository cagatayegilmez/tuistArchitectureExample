//
//  ProfileDependencies.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Dependencies shared across the profile tab
public struct ProfileDependencies {

    /// Session storage used to clear the logged in state
    public let sessionStore: any ProfileSessionStoring
    /// Receiver of the events that leave the profile tab
    public private(set) weak var flowDelegate: (any ProfileFlowDelegate)?

    /// Creates the profile tab dependencies
    ///
    /// - Parameters:
    ///   - sessionStore: Session storage used to clear the logged in state
    ///   - flowDelegate: Receiver of the events that leave the profile tab
    public init(sessionStore: any ProfileSessionStoring,
                flowDelegate: any ProfileFlowDelegate) {
        self.sessionStore = sessionStore
        self.flowDelegate = flowDelegate
    }
}
