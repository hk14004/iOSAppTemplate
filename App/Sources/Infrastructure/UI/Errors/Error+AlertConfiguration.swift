//
//  Error+AlertConfiguration.swift
//  AppName
//
//  Created by Hardijs Kirsis on 09/06/2025.
//  Copyright © 2025 AppName. All rights reserved.
//

import DevToolsCore

extension Error {
    func makeAlertConfiguration(
        buttons: [AlertConfiguration.Button] = []
    ) -> AlertConfiguration {
        return AlertConfiguration(
            title: alertContent.title,
            message: alertContent.message,
            buttons: buttons.isEmpty ? [defaultOkeyButton] : buttons
        )
    }
    
    var fallbackErrorContent: UIPresentableErrorContent {
        UIPresentableErrorContent(
            title: AppStrings.Error.Generic.title,
            message: AppStrings.Error.Generic.message
        )
    }
    
    private var alertContent: UIPresentableErrorContent {
        guard let presentableError = self as? UIPresentableError else {
            return fallbackErrorContent
        }
        return presentableError.presentableContent
    }
    
    private var defaultOkeyButton: AlertConfiguration.Button {
        AlertConfiguration.Button(
            title: AppStrings.Globals.ok,
            action: {}
        )
    }
}
