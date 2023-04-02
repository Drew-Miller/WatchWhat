//
//  SearchData.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
// 

import Foundation

@MainActor
class SearchViewModel: ObservableObject {
    @Published private var searchPage: MediaPage?
    
    var page: Int? {
        return searchPage?.page
    }
    var total_pages: Int? {
        return searchPage?.total_pages
    }
    var total_results: Int? {
        return searchPage?.total_results
    }
    var results: [Media] {
        return searchPage?.results ?? [Media]()
    }

    func loadData(query: String, page: Int = 1) async {
        await fetchData(query: query, page: page)
    }

    private func fetchData(query: String, page: Int) async {
        Networking.shared.SearchQuery(query: query) { result in
            self.searchPage = result
        }
    }
}
