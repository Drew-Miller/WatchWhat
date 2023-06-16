//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

let mediaData = [
    Media(id: 0, name: "War of the Worlds", poster: nil, type: .movie),
    Media(id: 1, name: "Titanic", poster: nil, type: .movie),
    Media(id: 2, name: "The Dark Knight", poster: nil, type: .movie),
    Media(id: 3, name: "The Unbearable Weight of Massive Talent", poster: nil, type: .movie),
    Media(id: 4, name: "The Green Mile", poster: nil, type: .movie),
    Media(id: 5, name: "Citizen Kane", poster: nil, type: .movie)
    Media(id: 6, name: "Eastern Promises", poster: nil, type: .movie),
    Media(id: 7, name: "Alien", poster: nil, type: .movie),
    Media(id: 8, name: "IDK", poster: nil, type: .movie),
    Media(id: 9, name: "Foo Bar", poster: nil, type: .movie)
]()

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                // Movies
                LazyVStack(alignment: .leading, spacing: 24) {
                    CategoryRow(categoryName: "Popular", items: viewModel.popular)
                    CategoryRow(categoryName: "Trending", items: viewModel.trending)
                    CategoryRow(categoryName: "Discover", items: viewModel.discover)
                }
                .task {
                    await viewModel.loadData()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .preferredColorScheme(.dark)
    }
}
