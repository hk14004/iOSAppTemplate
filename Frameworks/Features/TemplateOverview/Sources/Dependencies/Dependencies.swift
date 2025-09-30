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
    public let getRemoteOffersUseCase: GetRemoteOffersUseCase
    public let trackCachedOffersUseCase: TrackCachedOffersUseCase
    public let getRemoteAccountsUseCase: GetRemoteAccountsUseCase
    public let trackCachedAccountsUseCase: TrackCachedAccountsUseCase
    public let offerDetailsScreenFactory: any OfferDetailsScreenFactory
    public let logoutUseCase: LogoutUseCase
    
    public init(
        getRemoteOffersUseCase: GetRemoteOffersUseCase,
        trackCachedOffersUseCase: TrackCachedOffersUseCase,
        getRemoteAccountsUseCase: GetRemoteAccountsUseCase,
        trackCachedAccountsUseCase: TrackCachedAccountsUseCase,
        offerDetailsScreenFactory: any OfferDetailsScreenFactory,
        logoutUseCase: LogoutUseCase
    ) {
        self.getRemoteOffersUseCase = getRemoteOffersUseCase
        self.trackCachedOffersUseCase = trackCachedOffersUseCase
        self.getRemoteAccountsUseCase = getRemoteAccountsUseCase
        self.trackCachedAccountsUseCase = trackCachedAccountsUseCase
        self.offerDetailsScreenFactory = offerDetailsScreenFactory
        self.logoutUseCase = logoutUseCase
    }
}

typealias AppColors = TemplateDesignSystemAsset.Colors
typealias AppImages = TemplateDesignSystemAsset.Images
typealias AppStrings = TemplateLocalization
typealias AppLocalization = RuntimeLocalization
typealias AppLocalizationObserver = RuntimeLocalizationObserver
typealias AppLocalizedPreview = RuntimeLocalizedPreview
