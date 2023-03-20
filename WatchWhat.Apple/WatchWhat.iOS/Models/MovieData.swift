//
//  MovieData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

class MovieData: ObservableObject {
    @Published private(set) var movie: MovieDetails?
    // @Published private(set) var credits: MovieExtrasQuery.Data.Credits?
    @Published private(set) var trailers: [Video]? // fetched through videos
    @Published private(set) var recommendations: [Movie]?
    @Published private(set) var similar: [Movie]?
    @Published private(set) var watchProviders: WatchProviders?
    @Published private(set) var webUrl: String?
    
    func openWebUrl(id: Int, providerName: String) {
        Task.init {
            WatchWhat.apolloClient.fetch(query: WatchWhatSchema.WebURLQuery(tmdbId: id, titleType: "movie", sourceName: providerName)) { result in
                guard let data = try? result.get().data else { return }
                
                DispatchQueue.main.async {
                    self.webUrl = data.webUrl
                }
            }
        }
    }
    
    func loadData(id: Int, region: String?) {
        Task.init {
            async let movies: ()            = fetchMovie(id: id)
            async let videos: ()            = fetchVideos(id: id)
            async let recommendations: ()   = fetchRecommendations(id: id)
            async let similar: ()           = fetchSimilar(id: id)
            
            await [ movies, videos, recommendations, similar ]
        }
        Task.init {
            if !(region ?? "").isEmpty {
                await fetchWatchProviders(id: id, region: region!)
            }
        }
    }

    private func fetchMovie(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.MovieQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.movie = MovieDetails(data: data.movie.__data)
            }
        }
    }
    
    private func fetchVideos(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.VideosQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.trailers = data.videos.results.filter {
                    $0.official && $0.name!.lowercased().contains("trailer")
                }.map {
                    return Video(data: $0.__data)
                }
            }
        }
    }
    
    private func fetchRecommendations(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.RecommendationsQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                // self.credits = data.credits
                self.recommendations = data.recommendations.results.map {
                    Movie(data: $0.__data)
                }
            }
        }
    }
    
    private func fetchSimilar(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.SimilarQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.similar = data.similar.results.map {
                    return Movie(data: $0.__data)
                }
            }
        }
    }
    
    private func fetchWatchProviders(id: Int, region: String) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.WatchMovieQuery(movieId: id, region: region)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.watchProviders = WatchProviders(data: data.watchMovie.__data)
            }
        }
    }
}
