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

class ApiClient {
    static var shared = ApiClient()
    
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
    
    func webURL(id: Int, providerName: String, completion: @escaping (String) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.WebURLQuery(tmdbId: id, titleType: "movie", sourceName: providerName)) { result in
            guard let data = try? result.get().data else { return }

            completion(data.webUrl)
        }
    }
    
    func trendingQuery(completion: @escaping ([Media]) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.TrendingQuery(media: "movie", time: "day")) { result in
            guard let data = try? result.get().data else { return }
                        
            let trending = data.trending.results.map {
                return Media(data: $0.__data)
            }

            completion(trending)
        }
    }
    
    func popularQuery(completion: @escaping ([Media]) -> Void) {
        let params = WatchWhatSchema.PopularParams(page: 1, region: "US")
        let nullable = GraphQLNullable<WatchWhatSchema.PopularParams>(params)
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.PopularQuery(media: "movie", params: nullable)) { result in
            guard let data = try? result.get().data else { return }
                        
            let popular = data.popular.results.map {
                return Media(data: $0.__data)
            }

            completion(popular)
        }
    }
    
    func discoverQuery(completion: @escaping ([Media]) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.DiscoverQuery(media: "movie", params: nil)) { result in
            guard let data = try? result.get().data else { return }
                        
            let discover = data.discover.results.map {
                return Media(data: $0.__data)
            }

            completion(discover)
        }
    }
    
    func searchQuery(query: String, completion: @escaping (MediaPage) -> Void) {
        let params = WatchWhatSchema.SearchParams(query: query)
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.SearchQuery(media: "movie", params: params)) { result in
            guard let data = try? result.get().data else { return }
                        
            let search = MediaPage(data: data.search.__data, results: data.search.results.map { $0.__data })

            completion(search)
        }
    }
    
    func movieQuery(id: Int, completion: @escaping (Movie) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.MovieQuery(movieId: id)) { result in
            guard let data = try? result.get().data else { return }

            let movie = Movie(data: data.movie.__data, genres: data.movie.genres.map { return $0.__data }, production_companies: data.movie.production_companies.map { return $0.__data }, production_countries: data.movie.production_countries.map { return $0.__data }, spoken_languages: data.movie.spoken_languages.map { return $0.__data })
            completion(movie)
        }
    }
    
    func similarQuery(media: String!, id: Int, completion:  @escaping ([Media]) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.SimilarQuery(media: media, id: id)) { result in
            guard let data = try? result.get().data else { return }

            let similar: [Media] = data.similar.results.map {
                return Media(data: $0.__data)
            }
            
            completion(similar)
        }
    }
    
    func videosQuery(media: String!, id: Int, completion:  @escaping ([Video]) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.VideosQuery(media: media, id: id)) { result in
            guard let data = try? result.get().data else { return }

            let videos = data.videos.results.map {
                return Video(data: $0.__data)
            }
            
            completion(videos)
        }
    }
    
    func providersQuery(media: String!, id: Int!, region: String!, completion: @escaping (Providers) -> Void) {
        ApiClient.shared.apollo.fetch(query: WatchWhatSchema.ProvidersQuery(media: media, id: id, region: region)) { result in
            guard let data = try? result.get().data else { return }

            let providers = Providers(data: data.providers.__data, buy: data.providers.buy?.map { return $0.__data }, rent: data.providers.rent?.map { return $0.__data }, flatrate: data.providers.flatrate?.map { return $0.__data })
            
            completion(providers) 
        }
    }
}
