//
//  PreLoginDependencies.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Dependencies shared across the pre-login flow
public struct PreLoginDependencies {

    /// Session storage used to persist the logged in state
    public let sessionStore: any PreLoginSessionStoring
    /// Receiver of the events that leave the pre-login flow
    public private(set) weak var flowDelegate: (any PreLoginFlowDelegate)?

    /// Creates the pre-login flow dependencies
    ///
    /// - Parameters:
    ///   - sessionStore: Session storage used to persist the logged in state
    ///   - flowDelegate: Receiver of the events that leave the pre-login flow
    public init(sessionStore: any PreLoginSessionStoring,
                flowDelegate: any PreLoginFlowDelegate) {
        self.sessionStore = sessionStore
        self.flowDelegate = flowDelegate
    }
}
