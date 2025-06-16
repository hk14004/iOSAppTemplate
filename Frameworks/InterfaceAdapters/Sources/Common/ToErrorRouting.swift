//
//  ToErrorRouting.swift
//  InterfaceAdapters
//
//  Created by Hardijs Kirsis on 19/05/2025.
//  Copyright © 2025 AppName. All rights reserved.
//

import Foundation

public protocol ToErrorRouting {
    func routeToOkeyErrorAlert(_ error: Error, onDismiss: (() -> Void)?)
}
