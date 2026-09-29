//
//  SessionStoring.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import PreLoginModule
import ProfileModule

protocol SessionStoring: AnyObject {

    var isLoggedIn: Bool { get }
}

typealias AppSessionStoring = SessionStoring & PreLoginSessionStoring & ProfileSessionStoring
