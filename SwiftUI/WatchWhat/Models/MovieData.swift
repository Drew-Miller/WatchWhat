//
//  MovieData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

class MovieData: ObservableObject {
    @Published private(set) var movie: MovieDetails?
    @Published private(set) var credits: MovieExtrasQuery.Data.Credits?
    @Published private(set) var videos: MovieExtrasQuery.Data.Videos?
    @Published private(set) var recommendations: [Movie]?
    @Published private(set) var watchProviders: WatchProviders?
    @Published private(set) var webUrl: String?
    
    func openWebUrl(id: Int, providerName: String) {
        Task.init {
            WatchWhat.apolloClient.fetch(query: WebUrl(tmdbId: id, titleType: "movie", sourceName: providerName)) { result in
                guard let data = try? result.get().data else { return }
                
                DispatchQueue.main.async {
                    self.webUrl = data.webUrl
                }
            }
        }
    }
    
    func loadData(id: Int, region: String?) {
        Task.init {
            await fetchMovie(id: id)
        }
        Task.init {
            await fetchMovieExtras(id: id)
        }
        if !(region ?? "").isEmpty {
            Task.init {
                await fetchWatchProviders(id: id, region: region!)
            }
        }
    }

    private func fetchMovie(id: Int) async {
        WatchWhat.apolloClient.fetch(query: MovieQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.movie = MovieDetails(data: data.movie.__data)
            }
        }
    }
    
    private func fetchMovieExtras(id: Int) async {
        WatchWhat.apolloClient.fetch(query: MovieExtrasQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.credits = data.credits
                self.videos = data.videos
                self.recommendations = data.recommendations.results.map {
                    return Movie(data: $0.__data)
                }
            }
        }
    }
    
    private func fetchWatchProviders(id: Int, region: String) async {
        WatchWhat.apolloClient.fetch(query: WatchMovieQuery(movieId: id, region: region)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.watchProviders = WatchProviders(data: data.watchMovie.__data)
            }
        }
    }
}
