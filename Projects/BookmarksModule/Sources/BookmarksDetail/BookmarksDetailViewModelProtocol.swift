//
//  BookmarksDetailViewModelProtocol.swift
//  BookmarksModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol BookmarksDetailViewModelProtocol: AnyObject, Observable {

    var title: String { get }
}
