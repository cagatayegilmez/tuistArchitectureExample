//
//  MainTab.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

enum MainTab: Int, CaseIterable {

    case home
    case explore
    case bookmarks
    case profile

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .explore:
            return "Explore"
        case .bookmarks:
            return "Bookmarks"
        case .profile:
            return "Profile"
        }
    }

    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .explore:
            return "safari"
        case .bookmarks:
            return "bookmark"
        case .profile:
            return "person"
        }
    }

    var tabBarItem: UITabBarItem {
        UITabBarItem(title: title,
                     image: UIImage(systemName: systemImageName),
                     tag: rawValue)
    }
}
