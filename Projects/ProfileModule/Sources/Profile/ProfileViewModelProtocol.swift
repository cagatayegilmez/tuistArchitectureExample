//
//  ProfileViewModelProtocol.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol ProfileViewModelProtocol: AnyObject, Observable {

    var title: String { get }

    /// Handles the settings button tap
    func settingsTapped()

    /// Handles the logout button tap
    func logoutTapped()
}
