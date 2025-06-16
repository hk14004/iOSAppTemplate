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
        public static let name = "AppName"
        public static let orgName = "SIA AppName"
        public static let targetVersion = "18.0"
    }
}
