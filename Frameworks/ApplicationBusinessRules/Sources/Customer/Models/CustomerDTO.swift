//
//  CustomerDTO.swift
//  ApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation

public struct CustomerDTO {
    public let id: String
    public let displayName: String
    
    public init(
        id: String,
        displayName: String,
    ) {
        self.id = id
        self.displayName = displayName
    }
}
