//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

private func currentFramework() -> Project.Framework {
    .TemplateData
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
                .project(target: Project.Framework.TemplateApplication.rawValue, path: "../\(Project.Framework.TemplateApplication.rawValue)"),
                .project(target: Project.Framework.TemplateNetwork.rawValue, path: "../\(Project.Framework.TemplateNetwork.rawValue)"),
                .project(target: Project.Framework.TemplatePersistance.rawValue, path: "../\(Project.Framework.TemplatePersistance.rawValue)")
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
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: currentFramework().getTestTargetName())
    ]
)
