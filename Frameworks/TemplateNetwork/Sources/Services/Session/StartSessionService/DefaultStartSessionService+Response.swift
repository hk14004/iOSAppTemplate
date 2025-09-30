//
//  DefaultStartSessionService+Response.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import TemplateApplication

extension DefaultStartSessionService {
    struct StartSessionResponse: Codable {
        let accessToken: String
        let refreshToken: String
        let expiresInSec: Int
        
        func mapToDomain(id: String) -> StartSessionServiceOutput {
            StartSessionServiceOutput(
                bearerToken: accessToken,
                refreshToken: refreshToken,
                expirationDurationInSecs: expiresInSec,
                userID: id
            )
        }
    }
}
