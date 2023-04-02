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
        if let token = defaults.string(forKey: .defaultKeys.token) {
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
    static var shared = Networking()
    
    private lazy var apollo: ApolloClient = Networking.shared.initApollo()
    
    private func initApollo() -> ApolloClient {
        let endpointURL = Configuration.baseURL
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let interceptorProvider = NetworkInterceptorsProvider(
            interceptors: [TokenInterceptor()],
            store: store
        )
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider, endpointURL: endpointURL
        )
        return ApolloClient(networkTransport: networkTransport, store: store)
    }
    
    func WebURL(id: Int, providerName: String, completion: @escaping (String) -> Void) {
        Networking.shared.apollo.fetch(query: WatchWhatSchema.WebURLQuery(tmdbId: id, titleType: "movie", sourceName: providerName)) { result in
            guard let data = try? result.get().data else { return }

            completion(data.webUrl)
        }
    }
    
    func TrendingQuery(completion: @escaping ([Media]) -> Void) {
        Networking.shared.apollo.fetch(query: WatchWhatSchema.TrendingQuery(media: "movie", time: "day")) { result in
            guard let data = try? result.get().data else { return }
                        
            let trending = data.trending.results.map {
                return Media(data: $0.__data)
            }

            completion(trending)
        }
    }
    
    func PopularQuery(completion: @escaping ([Media]) -> Void) {
        let params = WatchWhatSchema.PopularParams(page: 1, region: "US")
        let nullable = GraphQLNullable<WatchWhatSchema.PopularParams>(params)
        Networking.shared.apollo.fetch(query: WatchWhatSchema.PopularQuery(media: "movie", params: nullable)) { result in
            guard let data = try? result.get().data else { return }
                        
            let popular = data.popular.results.map {
                return Media(data: $0.__data)
            }

            completion(popular)
        }
    }
    
    func DiscoverQuery(completion: @escaping ([Media]) -> Void) {
        Networking.shared.apollo.fetch(query: WatchWhatSchema.DiscoverQuery(media: "movie", params: nil)) { result in
            guard let data = try? result.get().data else { return }
                        
            let discover = data.discover.results.map {
                return Media(data: $0.__data)
            }

            completion(discover)
        }
    }
    
    func SearchQuery(query: String, completion: @escaping ([Media]) -> Void) {
        let params = WatchWhatSchema.SearchParams(query: query)
        Networking.shared.apollo.fetch(query: WatchWhatSchema.SearchQuery(media: "movie", params: params)) { result in
            guard let data = try? result.get().data else { return }
                        
            let search = data.search.results.map {
                return Media(data: $0.__data)
            }

            completion(search)
        }
    }
    
    func MovieQuery(id: Int, completion: @escaping (Movie) -> Void) {
        Networking.shared.apollo.fetch(query: WatchWhatSchema.MovieQuery(movieId: id)) { result in
            guard let data = try? result.get().data else { return }

            let movie = Movie(data: data.movie.__data)
            completion(movie)
        }
    }
    
    func SimilarQuery(media: String!, id: Int, completion:  @escaping ([Media]) -> Void) {
        Networking.shared.apollo.fetch(query: WatchWhatSchema.SimilarQuery(media: media, id: id)) { result in
            guard let data = try? result.get().data else { return }

            let similar: [Media] = data.similar.results.map {
                return Media(data: $0.__data)
            }
            
            completion(similar)
        }
    }
    
    func VideosQuery(media: String!, id: Int, completion:  @escaping ([Video]) -> Void) {
        Networking.shared.apollo.fetch(query: WatchWhatSchema.VideosQuery(media: media, id: id)) { result in
            guard let data = try? result.get().data else { return }

            let videos = data.videos.results.map {
                return Video(data: $0.__data)
            }
            
            completion(videos)
        }
    }
}
