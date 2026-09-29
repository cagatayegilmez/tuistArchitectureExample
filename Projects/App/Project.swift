//
//  AppProject.swift
//  TuistArchitectureExample
//
//  Created Çağatay Eğilmez on 13.07.2026
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: "App",
    bundleIdSuffix: "app",
    hasTests: false,
    dependencies: [
        .module("DesignSystem"),
        .module("Components"),
        .module("PreLoginModule"),
        .module("HomeModule"),
        .module("ExploreModule"),
        .module("BookmarksModule"),
        .module("ProfileModule")
    ]
)
