//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = Project.Root.bundleIdPrefix + Project.Framework.TemplateEnterprise.rawValue
}

let project = Project(
    name: Project.Framework.TemplateEnterprise.rawValue,
    organizationName: Project.Root.orgName,
    settings: Project.makeSettings(),
    targets: [
        .target(
            name: Project.Framework.TemplateEnterprise.rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: Constants.bundleId,
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        ),
        .target(
            name: Project.Framework.TemplateEnterprise.getTestTargetName(),
            destinations: .iOS,
            product: .unitTests,
            bundleId: Constants.bundleId + ".test",
            deploymentTargets: .iOS(Project.Root.targetVersion),
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [
                .target(name: Project.Framework.TemplateEnterprise.rawValue),
                .external(name: Project.Dependencies.DevToolsCore.rawValue)
            ]
        )
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.TemplateEnterprise.getTestTargetName())
    ]
)
