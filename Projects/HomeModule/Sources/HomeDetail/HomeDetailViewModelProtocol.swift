//
//  HomeDetailViewModelProtocol.swift
//  HomeModule
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import Observation

protocol HomeDetailViewModelProtocol: AnyObject, Observable {

    var title: String { get }
}
