//
//  Coordinator.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 29.09.2026.
//

import UIKit

protocol Coordinator: AnyObject {

    var rootViewController: UIViewController { get }

    /// Builds the initial screen of the flow
    func start()
}
