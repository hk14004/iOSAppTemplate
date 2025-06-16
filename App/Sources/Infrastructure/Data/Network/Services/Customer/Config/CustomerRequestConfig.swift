//
//  FetchCustomersRequestConfig.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 16/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation
import DevToolsNetworking

enum CustomerRequestConfig {
    case fetchCustomers
}

extension CustomerRequestConfig: DevRequestConfig {
    var baseURL: String {
        "https://github.com"
    }

    var path: String {
        switch self {
        case .fetchCustomers:
            "/Payloads/customers.json"
        }
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var requiresAuthorization: Bool {
        false
    }
}
