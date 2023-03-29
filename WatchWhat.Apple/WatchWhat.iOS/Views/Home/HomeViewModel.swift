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
    @Published private(set) var categories: [Category] = [Category]()

    func loadData() async {
        await fetchData()
    }

    private func fetchData() async {
        Networking.shared.DiscoverQuery { categories in
            self.categories = categories
        }
    }
}
