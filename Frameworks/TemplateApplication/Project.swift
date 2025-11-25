//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

private func currentFramework() -> Project.Framework {
    .TemplateApplication
}

let project = Project(
    name: currentFramework().rawValue,
    organizationName: Project.Root.orgName,
    settings: Project.makeSettings(),
    targets: [
        .target(
            name: currentFramework().rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: currentFramework().getBundleID(),
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .project(target: Project.Framework.TemplateEnterprise.rawValue, path: "../\(Project.Framework.TemplateEnterprise.rawValue)"),
                .external(name: Project.Dependencies.DevToolsCore.rawValue),
                .project(target: Project.Framework.TemplateLocalization.rawValue, path: "../\(Project.Framework.TemplateLocalization.rawValue)")
            ]
        ),
        .target(
            name: currentFramework().getTestTargetName(),
            destinations: .iOS,
            product: .unitTests,
            bundleId: currentFramework().getTestBundleID(),
            deploymentTargets: .iOS(Project.Root.targetVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: currentFramework().rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue),
                .external(name: Project.Dependencies.DevToolsXCTest.rawValue),
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: currentFramework().getTestTargetName())
    ]
)
