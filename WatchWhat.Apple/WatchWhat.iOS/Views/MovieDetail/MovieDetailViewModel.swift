//
//  MovieData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published private(set) var movie: Movie?
    // @Published private(set) var credits: MovieExtrasQuery.Data.Credits?
    @Published private(set) var trailers: [Video]? // fetched through videos
    @Published private(set) var recommendations: [Media]?
    @Published private(set) var similar: [Media]?
    @Published private(set) var stream: [Provider]?
    @Published private(set) var webUrl: String?
    
    func openWebUrl(id: Int, providerName: String) async {
        Networking.shared.WebURL(id: id, providerName: providerName) { webUrl in
            self.webUrl = webUrl
        }
    }
    
    func loadData(id: Int, region: String?) async {
        await [
            fetchMovie(id: id),
            fetchTrailers(id: id),
            fetchSimilar(id: id),
            fetchWatchProviders(id: id, region: !(region ?? "").isEmpty ? region! : "US")
        ]
    }

    private func fetchMovie(id: Int) async {
        Networking.shared.MovieQuery(id: id) { movie in
            self.movie = movie
        }
    }
    
    private func fetchTrailers(id: Int) async {
        Networking.shared.VideosQuery(media: "movie", id: id) { result in
            self.trailers = result.filter {
                $0.official && $0.name!.lowercased().contains("trailer")
            }.map {
                return Video(data: $0.__data)
            }
        }
    }
    
    private func fetchSimilar(id: Int) async {
        Networking.shared.SimilarQuery(media: "movie", id: id) { result in
            self.similar = result
        }
    }
    
    private func fetchWatchProviders(id: Int, region: String) async {
        Networking.shared.ProvidersQuery(media: "movie", id: id, region: region) { result in
            if let flatrate = result.flatrate {
                self.stream = flatrate.map {
                    Provider(data: $0.__data)
                }
            }
        }
    }
}
