//
//  MovieData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published private(set) var movie: MovieDetails?
    // @Published private(set) var credits: MovieExtrasQuery.Data.Credits?
    @Published private(set) var trailers: [Video]? // fetched through videos
    @Published private(set) var recommendations: [Movie]?
    @Published private(set) var similar: [Movie]?
    @Published private(set) var stream: [Provider]?
    @Published private(set) var webUrl: String?
    
    func openWebUrl(id: Int, providerName: String) async {
        Apollo.client.fetch(query: WatchWhatSchema.WebURLQuery(tmdbId: id, titleType: "movie", sourceName: providerName)) { result in
            guard let data = try? result.get().data else { return }
            
            self.webUrl = data.webUrl
        }
    }
    
    func loadData(id: Int, region: String?) async {
        let calls = [
            fetchMovie(id: id),
            fetchTrailers(id: id),
            fetchRecommendations(id: id),
            fetchSimilar(id: id)
        ]
        
        if !(region ?? "").isEmpty {
            calls.append(fetchWatchProviders(id: id, region: region!))
        }
        
        await calls
    }

    private func fetchMovie(id: Int) async {
        Apollo.client.fetch(query: WatchWhatSchema.MovieQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
            
            self.movie = MovieDetails(data: data.movie.__data)
        }
    }
    
    private func fetchTrailers(id: Int) async {
        Apollo.client.fetch(query: WatchWhatSchema.VideosQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            self.trailers = data.videos.results.filter {
                $0.official && $0.name!.lowercased().contains("trailer")
            }.map {
                return Video(data: $0.__data)
            }
        }
    }
    
    private func fetchRecommendations(id: Int) async {
        Apollo.client.fetch(query: WatchWhatSchema.RecommendationsQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            self.recommendations = data.recommendations.results.map {
                Movie(data: $0.__data)
            }
        }
    }
    
    private func fetchSimilar(id: Int) async {
        Apollo.client.fetch(query: WatchWhatSchema.SimilarQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            self.similar = data.similar.results.map {
                return Movie(data: $0.__data)
            }
        }
    }
    
    private func fetchWatchProviders(id: Int, region: String) async {
        Apollo.client.fetch(query: WatchWhatSchema.WatchMovieQuery(movieId: id, region: region)) { result in
            guard let data = try? result.get().data else { return }
                        
            if let flatrate = data.watchMovie.flatrate {
                self.stream = flatrate.map {
                    Provider(data: $0.__data)
                }
            }
        }
    }
}
