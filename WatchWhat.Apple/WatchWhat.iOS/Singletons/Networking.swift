//
//  File.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Apollo
import Combine
import Foundation

class TokenInterceptor: ApolloInterceptor {
    let defaults = UserDefaults.standard

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        // Add the authorization header to the request.
        if let token = defaults.string(forKey: .keys.token) {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
        }
        
        // Share the unauthenticated with the network handler.
        chain.proceedAsync(
            request: request,
            response: response,
            completion: completion
        )
    }
}

class NetworkInterceptorsProvider: DefaultInterceptorProvider {
    let interceptors: [ApolloInterceptor]
    
    init(interceptors: [ApolloInterceptor], store: ApolloStore) {
        self.interceptors = interceptors
        super.init(store: store)
    }
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        self.interceptors.forEach { interceptor in
            interceptors.insert(interceptor, at: 0)
        }
        return interceptors
    }
}

class Networking {
    static let apollo: ApolloClient = Networking.initApollo()
    
    private static func initApollo() -> ApolloClient {
        let endpointURL = Configuration.baseURL
        let store = ApolloStore()
        let interceptorProvider = NetworkInterceptorsProvider(
            interceptors: [TokenInterceptor()],
            store: store
        )
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider, endpointURL: endpointURL
        )
        return ApolloClient(networkTransport: networkTransport, store: store)
    }
}
