//
//  Project+Constants.swift
//  ProjectDescriptionHelpers
//
//  Created by Hardijs Ķirsis on 03/07/2023.
//

import ProjectDescription

extension Project {
    public struct Root {
        nonisolated(unsafe) public static let shared: Root = Root()
        public static let name = "TemplateApp"
        public static let orgName = "Template"
        public static let targetVersion = "17.0"
        public static let bundleIdPrefix = "baltic.Template.mob"
    }
}
