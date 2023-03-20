//
//  PopularMovies.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

class HomeData: ObservableObject {
    @Published private(set) var page: Int?
    @Published private(set) var results: [MovieCategory] = [MovieCategory]()

    func loadData() {
        Task.init {
            await fetchData()
        }
    }

    private func fetchData() async {
        WatchWhat.apolloClient.fetch(query: WatchWhatSchema.DiscoverQuery()) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                self.results = data.discover.results.map {
                    return MovieCategory(data: $0.__data)
                }                
            }
        }
    }
}
