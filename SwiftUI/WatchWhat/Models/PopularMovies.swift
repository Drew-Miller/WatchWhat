//
//  PopularMovies.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

class PopularMovies: ObservableObject {
    @Published private(set) var page: Int?
    @Published private(set) var totalPages: Int?
    @Published private(set) var totalResults: Int?
    @Published private(set) var results: [Movie] = [Movie]()

    func loadData(page: Int = 1) {
        Task.init {
            await fetchData(page: page)
        }
    }

    func fetchData(page: Int) async {
        WhatchWhatClient.apollo.fetch(query: WatchWhatSchema.PopularMoviesQuery(page: 1)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.page           = data.popularMovies.page
                self.totalPages     = data.popularMovies.total_pages
                self.totalResults   = data.popularMovies.total_results
                
                // Convert to movie
                self.results        = data.popularMovies.results.map {
                    Movie.fromPopularMovies(movie: $0)
                }
            }
        }
    }
}
