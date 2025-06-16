//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = "baltic.\(Project.Framework.InterfaceAdapters.rawValue)"
}

let project = Project(
    name: Project.Framework.InterfaceAdapters.rawValue,
    organizationName: Project.Root.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: Project.Framework.InterfaceAdapters.rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: Constants.bundleId,
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsCore.rawValue),
                .project(target: Project.Framework.ApplicationBusinessRules.rawValue, path: "../\(Project.Framework.ApplicationBusinessRules.rawValue)"),
                .project(target: Project.Framework.Localization.rawValue, path: "../\(Project.Framework.Localization.rawValue)")
            ]),
        .target(
            name: Project.Framework.InterfaceAdapters.getTestTargetName(),
            destinations: .iOS,
            product: .unitTests,
            bundleId: Constants.bundleId + ".test",
            deploymentTargets: .iOS(Project.Root.targetVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: Project.Framework.InterfaceAdapters.rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.InterfaceAdapters.getTestTargetName())
    ]
)
