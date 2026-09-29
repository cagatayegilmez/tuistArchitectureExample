//
//  ExploreDetailViewModelProtocol.swift
//  ExploreModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol ExploreDetailViewModelProtocol: AnyObject, Observable {

    var title: String { get }
}
