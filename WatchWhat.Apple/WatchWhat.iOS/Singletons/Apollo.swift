//
//  File.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation
import Apollo

class TokenInterceptor: ApolloInterceptor {
    let token: String?
    
    init(token: String?) {
        self.token = token
    }
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        // Add the authorization header to the request.
        if let token = token {
            request.addHeader(name: "id-token", value: token)
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

class Apollo {
    static let client: ApolloClient = Apollo.initClient
    
    private static let initClient: ApolloClient = {
        let endpointURL = Configuration.baseURL
        let store = ApolloStore()
        let interceptorProvider = NetworkInterceptorsProvider(
            interceptors: [TokenInterceptor(token: nil)],
            store: store
        )
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider, endpointURL: endpointURL
        )
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
    
    private init() { }
}
