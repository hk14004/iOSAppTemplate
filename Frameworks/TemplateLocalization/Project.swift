//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

enum Constants {
    static let bundleId = Project.Root.bundleIdPrefix + Project.Framework.TemplateLocalization.rawValue
}

let project = Project(
    name: Project.Framework.TemplateLocalization.rawValue,
    organizationName: Project.Root.orgName,
    settings: Project.makeSettings(),
    targets: [
        .target(
            name: Project.Framework.TemplateLocalization.rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: Constants.bundleId,
            deploymentTargets: .iOS(Project.Root.targetVersion),
            resources: [
                "Resources/**"
            ],
            dependencies: [
                .external(name: Project.Dependencies.DevToolsLocalization.rawValue)
            ])
    ],
    schemes: [
        Project.appTargetScheme(name: Project.Framework.TemplateLocalization.getTestTargetName())
    ]
)
