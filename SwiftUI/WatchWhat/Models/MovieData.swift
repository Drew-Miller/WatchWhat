//
//  MovieData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import Foundation

class MovieData: ObservableObject {
    @Published private(set) var movie: MovieByIdQuery.Data.Movie?

    func loadData(id: Int) {
        Task.init {
            await fetchData(id: id)
        }
    }

    private func fetchData(id: Int) async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.MovieByIdQuery(id: id)) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.movie = data.movie
            }
        }
    }
}
