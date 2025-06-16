//
//  CustomerCD.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 1/05/2025.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation
import DevToolsCore
import DevToolsCoreData
import ApplicationBusinessRules

extension CustomerCD: PersistedModel {
    
    public enum PersistedField: String, PersistedModelField {
        case displayName
        case id
    }
    
    // TODO: Persist transformables
    public func toDomain(fields: Set<PersistedField>) throws -> CustomerDTO {
        func require(string: String?) throws -> String {
            guard let string = string else {
                throw NSError(domain: "PersistentStoreErrorDomain", code: 0)
            }
            return string
        }
        
        return CustomerDTO(
            id: try require(string: id),
            displayName: displayName ?? ""
        )
    }
    
    public func update(with model: CustomerDTO, fields: Set<PersistedField>) {
        if fields.contains(.id) { self.id = model.id }
        if fields.contains(.displayName) { self.displayName = model.displayName }
    }
}

extension CustomerDTO: @retroactive PersistableDomainModel {
    public typealias StoreType = CustomerCD
}
