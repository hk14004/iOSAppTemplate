//
//  DefaultOfferRepository.swift
//  Swedbank
//
//  Created by Hardijs Kirsis on 26/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import TemplateApplication
import TemplateEnterprise
import Combine
import Foundation
import DevToolsPersistance
import TemplateNetwork
import TemplateApplication
import TemplatePersistance

public class DefaultAccountRepository: AccountRepository {
    private let localStore: any AccountPersistedLayerInterface
    private let fetchRemoteAccountsService: FetchRemoteAccountsService
    
    public init(
        store: any AccountPersistedLayerInterface,
        fetchRemoteAccountsService: FetchRemoteAccountsService
    ) {
        self.localStore = store
        self.fetchRemoteAccountsService = fetchRemoteAccountsService
    }
    
    public func replace(with items: [Account]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func observeCachedList() -> AnyPublisher<[Account], Never> {
        localStore.observeList(predicate: nil, sortDescriptors: [.init(\.sortOrder)])
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    public func getRemoteAccounts() -> AnyPublisher<[Account], Never> {
        fetchRemoteAccountsService.use()
            .catch { _ in
                Just([])
            }
            .flatMap { [weak self] accounts in
                self?.replace(with: accounts)
                    .mapToVoid()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .flatMap { [weak self] _ -> AnyPublisher<[Account], Never> in
                self?.fetchStored()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchStored() -> AnyPublisher<[Account], Never> {
        Future<[Account], Never> { [weak self] promise in
            Task {
                let value = try await self?.localStore.getList(predicate: nil, sortDescriptors: [.init(\.sortOrder)]) ?? []
                promise(.success(value))
            }
        }
        .eraseToAnyPublisher()
    }
}
