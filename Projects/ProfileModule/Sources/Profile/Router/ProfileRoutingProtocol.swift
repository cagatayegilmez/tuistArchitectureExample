//
//  ProfileRoutingProtocol.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Foundation

protocol ProfileRoutingProtocol: AnyObject {

    /// Routes to the settings screen
    func routeToSettings()

    /// Routes out of the logged in flow after the user logs out
    func routeToLoggedOut()
}
