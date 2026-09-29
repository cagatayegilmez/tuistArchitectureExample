//
//  SettingsViewModelProtocol.swift
//  ProfileModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol SettingsViewModelProtocol: AnyObject, Observable {

    var title: String { get }
}
