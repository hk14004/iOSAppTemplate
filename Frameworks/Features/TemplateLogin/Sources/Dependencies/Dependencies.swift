//
//  Dependencies.swift
//  SwedDashboard
//
//  Created by Hardijs on 22/08/2025.
//  Copyright © 2025 Swedbank. All rights reserved.
//
import TemplateApplication
import TemplateDesignSystem
import TemplateLocalization
import DevToolsNavigation
import DevToolsLocalization

public struct Dependencies {
    let simpleLoginUseCase: SimpleLoginUseCase
    let getCurrentCustomerUseCase: GetCurrentCustomerUseCase
    let toSplashScreenRouting: ToSplashScreenRouting
    
    public init(
        simpleLoginUseCase: SimpleLoginUseCase,
        getCurrentCustomerUseCase: GetCurrentCustomerUseCase,
        toSplashScreenRouting: ToSplashScreenRouting
    ) {
        self.simpleLoginUseCase = simpleLoginUseCase
        self.getCurrentCustomerUseCase = getCurrentCustomerUseCase
        self.toSplashScreenRouting = toSplashScreenRouting
    }
}

typealias AppColors = TemplateDesignSystemAsset.Colors
typealias AppImages = TemplateDesignSystemAsset.Images
typealias AppStrings = TemplateLocalization
typealias AppLocalization = RuntimeLocalization
typealias AppLocalizationObserver = RuntimeLocalizationObserver
typealias AppLocalizedPreview = RuntimeLocalizedPreview
