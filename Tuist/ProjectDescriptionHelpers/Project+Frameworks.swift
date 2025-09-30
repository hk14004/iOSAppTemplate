//
//  Project+Frameworks.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 21/10/2023.
//

import ProjectDescription

public extension Project {
    static let frameworkDir = "Frameworks"
    enum Framework: String {
        case TemplateApplication
        case TemplateEnterprise
        case TemplateLocalization
        case TemplateNetwork
        case TemplateDesignSystem
        case TemplateData
        case TemplatePersistance
        case TemplateUtils
        // Features
        case TemplateOverview
        case TemplateLogin
        case TemplateContacts
    }
}

public extension Project.Framework {
    func getPath() -> Path {
        switch self {
        case .TemplateOverview, .TemplateLogin, .TemplateContacts:
            "\(Project.frameworkDir + "/" + "Features" + "/" + rawValue)"
        default:
            "\(Project.frameworkDir + "/" + rawValue)"
        }
    }
    
    func getTestTargetName() -> String {
        rawValue + "Test"
    }
    
    func getBundleID() -> String {
        Project.Root.bundleIdPrefix + rawValue
    }
    
    func getTestBundleID() -> String {
        getBundleID() + ".test"
    }
}
