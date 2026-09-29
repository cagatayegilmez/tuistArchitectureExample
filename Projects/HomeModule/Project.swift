//
//  HomeModuleProject.swift
//  TuistArchitectureExample
//
//  Created Çağatay Eğilmez on 29.09.2026
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.feature(
    name: "HomeModule",
    bundleIdSuffix: "homemodule",
    dependencies: [
        .module("DesignSystem"),
        .module("Components")
    ]
)
