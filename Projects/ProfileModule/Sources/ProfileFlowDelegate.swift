//
//  ProfileFlowDelegate.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Receives the events that leave the profile tab
public protocol ProfileFlowDelegate: AnyObject {

    /// Notifies that the user logged out and the logged in flow is complete
    func profileDidLogout()
}
