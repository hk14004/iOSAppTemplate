import Combine
import DevToolsNetworking
import ApplicationBusinessRules

class GithubFetchRemoteCustomersService: FetchRemoteCustomersService {
    private let networkClient: AppsNetworkClient
    
    init(networkClient: AppsNetworkClient) {
        self.networkClient = networkClient
    }
    
    func use() -> AnyPublisher<FetchRemoteCustomersServiceOutput, Error> {
        fetchResponse()
            .tryMap { response in
                try response.map { try $0.mapToDomain() }
            }
            .eraseToAnyPublisher()
    }
    
    private func fetchResponse() -> AnyPublisher<Response, Error> {
        networkClient.execute(CustomerRequestConfig.fetchCustomers)
    }
}
