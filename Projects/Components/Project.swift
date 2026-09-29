//
//  ComponentsProject.swift
//  TuistArchitectureExample
//
//  Created Çağatay Eğilmez on 29.09.2026
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: "Components",
    bundleIdSuffix: "components",
    hasTests: true,
    dependencies: [
        .module("DesignSystem")
    ]
)
