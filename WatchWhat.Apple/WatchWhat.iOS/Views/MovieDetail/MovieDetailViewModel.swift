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
    @Published private(set) var recommendations: [Item]?
    @Published private(set) var similar: [Item]?
    @Published private(set) var stream: [Provider]?
    @Published private(set) var webUrl: String?
    
    func openWebUrl(id: Int, providerName: String) async {
//        Networking.apollo.fetch(query: WatchWhatSchema.WebURLQuery(tmdbId: id, titleType: "movie", sourceName: providerName)) { result in
//            guard let data = try? result.get().data else { return }
//
//            self.webUrl = data.webUrl
//        }
    }
    
    func loadData(id: Int, region: String?) async {
        await [
            fetchMovie(id: id),
            fetchTrailers(id: id),
            fetchRecommendations(id: id),
            fetchSimilar(id: id),
            fetchWatchProviders(id: id, region: !(region ?? "").isEmpty ? region! : "US")
        ]
    }

    private func fetchMovie(id: Int) async {
//        Networking.apollo.fetch(query: WatchWhatSchema.MovieQuery(id: id)) { result in
//            guard let data = try? result.get().data else {
//                self.movie = nil
//                return
//            }
//
//            self.movie = MovieDetails(data: data.movie.__data)
//        }
    }
    
    private func fetchTrailers(id: Int) async {
//        Networking.apollo.fetch(query: WatchWhatSchema.VideosQuery(id: id)) { result in
//            guard let data = try? result.get().data else {
//                self.trailers = nil
//                return
//            }
//
//            self.trailers = data.videos.results.filter {
//                $0.official && $0.name!.lowercased().contains("trailer")
//            }.map {
//                return Video(data: $0.__data)
//            }
//        }
    }
    
    private func fetchRecommendations(id: Int) async {
//        Networking.apollo.fetch(query: WatchWhatSchema.RecommendationsQuery(id: id)) { result in
//            guard let data = try? result.get().data else {
//                self.recommendations = nil
//                return
//            }
//
//            self.recommendations = data.recommendations.results.map {
//                return Item.fromMovie(data: $0.__data)
//            }
//        }
    }
    
    private func fetchSimilar(id: Int) async {
//        Networking.apollo.fetch(query: WatchWhatSchema.SimilarQuery(id: id)) { result in
//            guard let data = try? result.get().data else {
//                self.similar = nil
//                return
//            }
//
//            self.similar = data.similar.results.map {
//                return Item.fromMovie(data: $0.__data)
//            }
//        }
    }
    
    private func fetchWatchProviders(id: Int, region: String) async {
//        Networking.apollo.fetch(query: WatchWhatSchema.WatchMovieQuery(movieId: id, region: region)) { result in
//            guard let data = try? result.get().data else {
//                self.stream = nil
//                return
//            }
//                        
//            if let flatrate = data.watchMovie.flatrate {
//                self.stream = flatrate.map {
//                    Provider(data: $0.__data)
//                }
//            }
//        }
    }
}
