//
//  ProfileSessionStoring.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

/// Session storage abstraction required by the profile tab
public protocol ProfileSessionStoring: AnyObject {

    /// Clears the logged in state after the user logs out
    func markLoggedOut()
}
