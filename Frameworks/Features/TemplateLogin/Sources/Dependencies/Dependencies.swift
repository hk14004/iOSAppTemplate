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
    
    public init(
        simpleLoginUseCase: SimpleLoginUseCase
    ) {
        self.simpleLoginUseCase = simpleLoginUseCase
    }
}

typealias AppColors = TemplateDesignSystemAsset.Colors
typealias AppImages = TemplateDesignSystemAsset.Images
typealias AppStrings = TemplateLocalization
typealias AppLocalization = RuntimeLocalization
typealias AppLocalizationObserver = RuntimeLocalizationObserver
typealias AppLocalizedPreview = RuntimeLocalizedPreview
