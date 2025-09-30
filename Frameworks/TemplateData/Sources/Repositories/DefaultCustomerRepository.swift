//
//  DefaultCustomerRepository.swift
//  Swedbank
//
//  Created by Hardijs Ķirsis on 30/12/2023.
//  Copyright © 2023 SWEDBANK AB. All rights reserved.
//

import TemplateApplication
import Combine
import DevToolsPersistance
import TemplateNetwork
import TemplatePersistance

public class DefaultCustomerRepository: CustomerRepository {
    
    private let fetchRemoteCustomersService: FetchRemoteCustomersService
    private let currentCustomerStore: CurrentCustomerStore
    private let localStore: any CustomerPersistedLayerInterface
    private let lastUsedCustomerStore: LastUsedCustomerStore

    public init(
        fetchRemoteCustomersService: FetchRemoteCustomersService,
        localStore: any CustomerPersistedLayerInterface,
        currentCustomerStore: CurrentCustomerStore,
        lastUsedCustomerStore: LastUsedCustomerStore
    ) {
        self.fetchRemoteCustomersService = fetchRemoteCustomersService
        self.localStore = localStore
        self.currentCustomerStore = currentCustomerStore
        self.lastUsedCustomerStore = lastUsedCustomerStore
    }
    
    public func getRemoteCustomers() -> AnyPublisher<[Customer], Error> {
        fetchRemoteCustomersService.use()
            .flatMap { [weak self] customers -> AnyPublisher<[Customer], Never> in
                self?.replace(with: customers)
                    .map { _ in customers }
                    .eraseToAnyPublisher() ?? .empty()
            }
            .eraseToAnyPublisher()
    }
    
    public func addOrUpdate(_ items: [Customer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.addOrUpdate(items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func getSingle(id: String) -> AnyPublisher<Customer?, Never> {
        Future<Customer?, Never> { [weak self] promise in
            Task {
                let customer = try await self?.localStore.getSingle(id: id)
                promise(.success(customer))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func getSingle(id: String) -> Customer? {
        try? localStore.getSingle(id: id)
    }
    
    public func replace(with items: [Customer]) -> AnyPublisher<Void, Never> {
        Future<Void, Never> { [weak self] promise in
            Task {
                try await self?.localStore.replace(with: items)
                promise(.success(()))
            }
        }
        .eraseToAnyPublisher()
    }
    
    public func getCurrentCustomer() -> Customer? {
        currentCustomerStore.getCurrentCustomer()
    }
    
    public func setCurrentCustomer(_ customer: Customer?) {
        currentCustomerStore.setCurrentCustomer(customer)
        lastUsedCustomerStore.setLastUsedCustomerID(customer?.id)
    }
    
    public func getLastUsedCustomer() -> Customer? {
        guard let id = lastUsedCustomerStore.getLastUsedCustomerID() else { return nil }
        return getSingle(id: id)
    }
}
