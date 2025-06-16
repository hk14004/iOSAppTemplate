//
//  DefaultFetchCustomersService+Response.swift
//  AppName
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 AppName. All rights reserved.
//

import Foundation
import ApplicationBusinessRules

extension GithubFetchRemoteCustomersService {
    typealias Response = [CustomerData]
    
    struct CustomerData: Codable {
        public let id: String
        public let displayName: String
        public let type: String
        public let hasIpRestriction: Bool
        public let hasUsableAccounts: Bool
        public let sortOrder: Int
        public let roles: [String]
        public let authorities: [String]
        public let isMain: Bool
        
        func mapToDomain() throws -> CustomerDTO {
            CustomerDTO(
                id: id,
                displayName: displayName
            )
        }
    }
}
