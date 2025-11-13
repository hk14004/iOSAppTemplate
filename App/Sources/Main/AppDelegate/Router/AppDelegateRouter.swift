//
//  AppDelegateRouter.swift
//  TemplateApp
//
//  Created by Hardijs on 11/11/2025.
//  Copyright © 2025 Template. All rights reserved.
//

import TemplateApplication

// sourcery: AutoMockable, marker=App
protocol AppDelegateRouter: ToSplashScreenRouting {}

class DefaultAppDelegateRouter: AppDelegateRouter {}

