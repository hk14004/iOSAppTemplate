//
//  Project.swift
//  Manifests
//
//  Created by Hardijs Ķirsis on 15/09/2023.
//

import ProjectDescriptionHelpers
import ProjectDescription

private func currentFramework() -> Project.Framework {
    .TemplateLogin
}

let project = Project(
    name: currentFramework().rawValue,
    organizationName: Project.Root.orgName,
    settings: Settings.settings(
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ]
    ),
    targets: [
        .target(
            name: currentFramework().rawValue,
            destinations: .iOS,
            product: .framework,
            bundleId: currentFramework().getBundleID(),
            deploymentTargets: .iOS(Project.Root.targetVersion),
            sources: ["Sources/**"],
            dependencies: [
                .external(name: Project.Dependencies.SnapKit.rawValue),
                .external(name: Project.Dependencies.DevToolsLocalization.rawValue),
                .external(name: Project.Dependencies.DevToolsUI.rawValue),
                .external(name: Project.Dependencies.DevToolsNavigation.rawValue),
                .project(target: Project.Framework.TemplateLocalization.rawValue, path: "../../\(Project.Framework.TemplateLocalization.rawValue)"),
                .project(target: Project.Framework.TemplateApplication.rawValue, path: "../../\(Project.Framework.TemplateApplication.rawValue)"),
                .project(target: Project.Framework.TemplateDesignSystem.rawValue, path: "../../\(Project.Framework.TemplateDesignSystem.rawValue)"),
                .project(target: Project.Framework.TemplateUtils.rawValue, path: "../../\(Project.Framework.TemplateUtils.rawValue)"),
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
