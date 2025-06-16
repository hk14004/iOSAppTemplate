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
        case ApplicationBusinessRules
        case InterfaceAdapters
        case Localization
    }
}

public extension Project.Framework {
    func getPath() -> Path {
        "\(Project.frameworkDir + "/" + rawValue)"
    }
    func getTestTargetName() -> String {
        rawValue + "Test"
    }
}
