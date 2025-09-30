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
import TemplatePersistance

public class DefaultOfferRepository: OfferRepository {
    private let localStore: any OfferPersistedLayerInterface
    private let fetchRemoteOffersService: FetchRemoteOffersService
    
    public init(
        store: any OfferPersistedLayerInterface,
        fetchRemoteOffersService: FetchRemoteOffersService
    ) {
        self.localStore = store
        self.fetchRemoteOffersService = fetchRemoteOffersService
    }
    
    public func replace(with items: [Offer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func observeCachedList() -> AnyPublisher<[Offer], Never> {
        localStore.observeList(predicate: nil, sortDescriptors: [.init(\.id, order: .forward)])
            .catch { _ in
                Just([])
            }
            .eraseToAnyPublisher()
    }
    
    public func getRemoteOffers() -> AnyPublisher<[Offer], Error> {
        fetchRemoteOffersService.use()
            .flatMap { [weak self] offers in
                self?.replace(with: offers)
                    .mapToVoid()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .flatMap { [weak self] _ -> AnyPublisher<[Offer], Never> in
                self?.fetchStored()
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchStored() -> AnyPublisher<[Offer], Never> {
        Future<[Offer], Never> { [weak self] promise in
            Task {
                let value = try await self?.localStore.getList(predicate: nil, sortDescriptors: [.init(\.id, order: .forward)]) ?? []
                promise(.success(value))
            }
        }
        .eraseToAnyPublisher()
    }
}
