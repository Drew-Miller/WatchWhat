//
//  MovieData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

class MovieData: ObservableObject {
    @Published private(set) var movie: MovieQuery.Data.Movie?
    @Published private(set) var credits: MovieExtrasQuery.Data.Credits?
    @Published private(set) var videos: MovieExtrasQuery.Data.Videos?
    @Published private(set) var recommendations: MovieExtrasQuery.Data.Recommendations?
    @Published private(set) var watchProviders: WatchProviders?
    
    
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
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.MovieQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.movie = data.movie
            }
        }
    }
    
    private func fetchMovieExtras(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.MovieExtrasQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.credits = data.credits
                self.videos = data.videos
                self.recommendations = data.recommendations
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
