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
                bundleId: "\(variant.bundleID).test"
            )
        ]
    }
    
    public var appVariants: [AppVariant] {
        [
            AppVariant(
                name: "AppName LV",
                productName: "AppName",
                displayName: "AppName Latvija",
                bundleID: "baltic.AppName.prod",
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
                name: "AppName LV Dev",
                productName: "AppName",
                displayName: "AppName Latvija Dev",
                bundleID: "baltic.AppName.dev",
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
