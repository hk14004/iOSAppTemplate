//
//  AppTypography.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 09/09/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import SwiftUI
import DevToolsUI

enum AppTypography: DevTypography {
    case title
    case title2
    case body
    case input
    case link1
    
    var scaledFont: UIFont {
        switch self {
        case .body:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        case .title:
            return UIFontMetrics.default.scaledFont(for: .boldSystemFont(ofSize: 16))
        case .title2:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16, weight: .medium))
        case .input:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 16))
        case .link1:
            return UIFontMetrics.default.scaledFont(for: .systemFont(ofSize: 18))
        }
    }
    
    var scaledFontSwiftUI: Font {
        Font(scaledFont)
    }
}
