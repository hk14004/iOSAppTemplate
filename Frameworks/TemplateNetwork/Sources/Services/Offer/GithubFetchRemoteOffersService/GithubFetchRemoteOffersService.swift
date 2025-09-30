//
//  MockFetchRemoteOffersService.swift
//  SwedApplicationBusinessRules
//
//  Created by Hardijs Kirsis on 27/05/2025.
//  Copyright © 2025 SWEDBANK AB. All rights reserved.
//

import Combine
import TemplateApplication

public class GithubFetchRemoteOffersService: FetchRemoteOffersService {
    // MARK: Properties
    private let networkClient: SwedNetworkClient
    
    // MARK: Lifecycle
    public init(networkClient: SwedNetworkClient) {
        self.networkClient = networkClient
    }
    
    // MARK: Methods
    public func use() -> AnyPublisher<FetchRemoteOffersServiceOutput, Error> {
        fetchResponse()
            .tryMap { response in
                try response.map { try $0.mapToDomain() }
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<GithubOffersResponse, Error> {
        networkClient.execute(OrderRequestConfig.fetchOrders)
    }
}
