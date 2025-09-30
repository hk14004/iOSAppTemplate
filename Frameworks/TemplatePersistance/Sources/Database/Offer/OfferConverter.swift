//
//  OfferConverter.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 04/07/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsPersistance
import TemplateApplication

public struct OfferConverter: DevModelConverter {
    
    public init() {}
    
    public func domainObject(from persistedModel: OfferSD) throws -> Offer {
        Offer(
            id: persistedModel.id,
            title: persistedModel.title,
            description: persistedModel.desc,
            date: persistedModel.date
        )
    }
    
    public func persistableObject(from domainModel: Offer) throws -> OfferSD {
        OfferSD(id: domainModel.id, title: domainModel.title, desc: domainModel.description, date: domainModel.date)
    }
    
    public func updatePersistedObject(with domainModel: Offer, object: OfferSD) throws {
        object.id = domainModel.id
        object.title = domainModel.title
        object.desc = domainModel.description
        object.date = domainModel.date
    }
}
