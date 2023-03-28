//
//  PopularMovies.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published private(set) var page: Int?
    @Published private(set) var categories: [MovieCategory] = [MovieCategory]()

    func loadData() async {
        await fetchData()
    }

    private func fetchData() async {
        Networking.apollo.fetch(query: WatchWhatSchema.DiscoverQuery()) { result in
            guard let data = try? result.get().data else { return }
                        
            self.categories = data.discover.results.map {
                return MovieCategory(data: $0.__data)
            }
        }
    }
}
