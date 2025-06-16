//
//  NetworkError+UIPresentableError.swift
//  AppName
//
//  Created by Hardijs Kirsis on 10/06/2025.
//  Copyright © 2025 AppName. All rights reserved.
//

import DevToolsNetworking
import DevToolsCore

extension NetworkError: @retroactive UIPresentableError {
    public var presentableContent: UIPresentableErrorContent {
        UIPresentableErrorContent (
            title: AppStrings.Error.Network.Generic.title,
            message: AppStrings.Error.Network.Generic.message
        )
    }
}
