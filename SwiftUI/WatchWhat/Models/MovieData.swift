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
    
    
    func loadData(id: Int) {
        Task.init {
            await fetchData(id: id)
        }
        Task.init {
            await fetchData(id: id)
        }
    }

    private func fetchData(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.MovieQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.movie = data.movie
            }
        }
    }
    
    private func fetchExtras(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.MovieExtrasQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                print(data)
                self.credits = data.credits
                self.videos = data.videos
                self.recommendations = data.recommendations
            }
        }
    }
}
