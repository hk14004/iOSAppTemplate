//
//  Project+Targets.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project.Root {
    public var allTargets: [Target] {
        return appTargets + appUnitTestTargets
    }
    
    private var appTargets: [Target] {
        appVariants.map { $0.toTuistTarget() }
    }
    
    private var appUnitTestTargets: [Target] {
        let variant = appVariants[1]
        return [
            .target(
                name: "App Unit Tests",
                destinations: .iOS,
                product: .unitTests,
                bundleId: "\(variant.bundleID).test",
                infoPlist: .default,
                sources: ["App/UnitTests/**"],
                dependencies: [
                    .target(name: variant.name),
                ]
            )
        ]
    }
    
    public var appVariants: [AppVariant] {
        [
            AppVariant(
                name: "Template LV",
                productName: "Template",
                displayName: "Template Latvija",
                bundleID: "baltic.Template.mob.lv.prod",
                configsSubdirectoryName: "",
                resourcesSubdirectoryName: "",
                teamID: "9FVL8NV4N7",
                debugProvisioningProfile: "",
                releaseProvisioningProfile: "",
                isProductionEnvironment: true,
                shouldSignWithDistributionCertificate: false,
                allowArbitaryLoads: false,
                appURLScheme: nil
            ),
            AppVariant(
                name: "Template LV Dev",
                productName: "Template",
                displayName: "Template Latvija Dev",
                bundleID: "baltic.Template.mob.lv.dev",
                configsSubdirectoryName: "",
                resourcesSubdirectoryName: "",
                teamID: "9FVL8NV4N7",
                debugProvisioningProfile: "",
                releaseProvisioningProfile: "",
                isProductionEnvironment: false,
                shouldSignWithDistributionCertificate: false,
                allowArbitaryLoads: true,
                appURLScheme: nil
            )
        ]
    }
}
