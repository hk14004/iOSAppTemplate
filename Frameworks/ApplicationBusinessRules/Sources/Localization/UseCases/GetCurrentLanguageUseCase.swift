//
//  GetCurrentLanguageUseCase.swift
//  ApplicationBusinessRules
//
//  Created by Hardijs Ķirsis on 16/12/2023.
//  Copyright © 2023 AppName. All rights reserved.
//

import Foundation

public protocol GetCurrentLanguageUseCase {
    func use() -> LanguageKey
}

public class DefaultGetCurrentLanguageUseCase: GetCurrentLanguageUseCase {
    private let languageRepository: LanguageRepository
    
    public init(languageRepository: LanguageRepository) {
        self.languageRepository = languageRepository
    }
    
    public func use() -> LanguageKey {
        languageRepository.getCurrentLanguage()
    }
}
