//
//  OrderRequestConfig.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 28/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Foundation
import DevToolsNetworking

enum OrderRequestConfig {
    case fetchOrders
}

extension OrderRequestConfig: DevRequestConfig {
    var baseURL: String {
        "http://192.168.8.208:3000/api"
    }

    var path: String {
        switch self {
        case .fetchOrders:
            "/orders"
        }
    }
    
    var method: DevHTTPMethod {
        .get
    }
    
    var requiresAuthorization: Bool {
        true
    }
}
