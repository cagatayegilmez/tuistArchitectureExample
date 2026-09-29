//
//  Project+Templates.swift
//  Tuist Architecture
//
//  Created by Çağatay Eğilmez on 23.09.2026.
//

import ProjectDescription

public extension Project {

    static func framework(
        name: String,
        bundleIdSuffix: String,
        hasResources: Bool = false,
        hasTests: Bool = true,
        dependencies: [TargetDependency] = [],
        testDependencies: [TargetDependency] = []
    ) -> Project {
        var targets: [Target] = [
            .framework(
                name: name,
                bundleIdSuffix: bundleIdSuffix,
                hasResources: hasResources,
                dependencies: dependencies
            )
        ]

        if hasTests {
            targets.append(
                .unitTests(
                    for: name,
                    bundleIdSuffix: bundleIdSuffix,
                    dependencies: testDependencies
                )
            )
        }

        return Project(name: name, targets: targets)
    }

    /// Creates a feature module project with MainActor default isolation and a unit test target
    ///
    /// - Parameters:
    ///   - name: Name of the feature module
    ///   - bundleIdSuffix: Bundle identifier suffix of the module
    ///   - dependencies: Dependencies of the feature target
    ///   - testDependencies: Additional dependencies of the unit test target
    /// - Returns: Project containing the feature target and its unit test target
    static func feature(
        name: String,
        bundleIdSuffix: String,
        dependencies: [TargetDependency] = [],
        testDependencies: [TargetDependency] = []
    ) -> Project {
        Project(
            name: name,
            targets: [
                .framework(
                    name: name,
                    bundleIdSuffix: bundleIdSuffix,
                    hasResources: false,
                    dependencies: dependencies,
                    settings: .featureSettings
                ),
                .unitTests(
                    for: name,
                    bundleIdSuffix: bundleIdSuffix,
                    dependencies: testDependencies,
                    settings: .featureSettings
                )
            ]
        )
    }

    static func app(
        name: String,
        bundleIdSuffix: String,
        hasTests: Bool = true,
        dependencies: [TargetDependency] = []
    ) -> Project {
        var targets: [Target] = [
            .app(
                name: name,
                bundleIdSuffix: bundleIdSuffix,
                dependencies: dependencies
            )
        ]

        if hasTests {
            targets.append(
                .unitTests(
                    for: name,
                    bundleIdSuffix: bundleIdSuffix
                )
            )
        }

        return Project(name: name, targets: targets)
    }
}
