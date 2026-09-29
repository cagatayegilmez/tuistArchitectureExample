//
//  PreLoginFlowDelegate.swift
//  PreLoginModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Receives the events that leave the pre-login flow
public protocol PreLoginFlowDelegate: AnyObject {

    /// Notifies that the user is authenticated and the pre-login flow is complete
    func preLoginDidFinish()
}
