//
//  AppAppearance.swift
//  AppName
//
//  Created by Hardijs Ķirsis on 29/12/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import UIKit
import DevToolsUI

class AppAppearance {}

// MARK: Public
extension AppAppearance {
    static func configureAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .red
        appearance.stackedLayoutAppearance.selected.iconColor = .red
        appearance.stackedLayoutAppearance.normal.iconColor = .red
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.red, .font: AppTypography.title.scaledFont]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.red, .font: AppTypography.title2.scaledFont]
        appearance.shadowColor = UIColor.clear
        AppearanceProxy.setDefault(tabbarAppearance: appearance)
        
        let navAppearance = UINavigationBarAppearance()
        AppearanceProxy.setDefault(controlTintColor: .red)
        AppearanceProxy.setDefault(navigationBarControlColor: .red)
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        navAppearance.titleTextAttributes = [.foregroundColor: UIColor.red]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        navAppearance.shadowColor = .clear
        UINavigationBar.appearance().prefersLargeTitles = true
        AppearanceProxy.setDefault(navigationBarAppearance: navAppearance)
    }
}
