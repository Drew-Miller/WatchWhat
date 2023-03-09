//
//  PopularMovies.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/8/23.
//

import Foundation

class HomeData: ObservableObject {
    @Published private(set) var page: Int?
    @Published private(set) var results = [HomeQuery.Data.Home.Result]()

    func loadData(page: Int = 1) {
        Task.init {
            await fetchData()
        }
    }

    func fetchData() async {
        WhatWhat.apolloClient.fetch(query: WatchWhatSchema.HomeQuery()) { result in
            guard let data = try? result.get().data else { return }
                        
            DispatchQueue.main.async {
                print(data.home.results[0].movies[0].poster_path!)
                self.results = data.home.results
                // Convert to movie
//                self.results        = data.popularMovies.results.map {
//                    Movie.fromPopularMovies(movie: $0)
//                }
            }
        }
    }
}
