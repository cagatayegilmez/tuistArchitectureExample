//
//  BookmarksViewModelProtocol.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol BookmarksViewModelProtocol: AnyObject, Observable {

    var title: String { get }

    /// Handles the detail button tap
    func detailTapped()
}
