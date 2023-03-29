//
//  SearchData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published private(set) var page: Int?
    @Published private(set) var totalPages: Int?
    @Published private(set) var totalResults: Int?
    @Published private(set) var results: [Item] = [Item]()

    func loadData(query: String, page: Int = 1) async {
        await fetchData(query: query, page: page)
    }

    private func fetchData(query: String, page: Int) async {
        let pageNullable = GraphQLNullable<Int>(integerLiteral: page)
        
        Networking.apollo.fetch(query: WatchWhatSchema.SearchQuery(query: query, page: pageNullable)) { result in
            guard let data = try? result.get().data else { return }
                        
            self.page = data.searchMovies.page
            self.totalPages = data.searchMovies.total_pages
            self.totalResults = data.searchMovies.total_results
            self.results = data.searchMovies.results.map {
                return Item.fromMovie(data: $0.__data)
            }
        }
    }
}
