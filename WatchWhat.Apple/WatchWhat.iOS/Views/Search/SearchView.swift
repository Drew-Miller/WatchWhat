//
//  Search.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var navigationData: NavigationData
    @Binding var searchValue: String
    @StateObject var viewModel = SearchViewModel()
        
    var body: some View {
        // Movies
        ZStack {
            ScrollView {
                content
                    .headerPadding()
                    .searchPadding()
                    .footerPadding()
            }
            
            layout
        }
    }
    
    var content: some View {
        LazyVStack(spacing: 0) {
            ForEach(viewModel.results.chunked(into: 2), id: \.self) { rowItems in
                LazyHStack {
                    ForEach(rowItems, id: \.self) { movie in
                        MovieView(movie: movie) { movieId in
                            navigationData.movieSelected(movieId)
                        }
                    }
                }
            }
        }
        .task(id: searchValue) {
            if !searchValue.isEmpty {
                viewModel.loadData(query: searchValue)
            }
        }
    }
    
    var layout: some View {
        VStack {
            Header()
                .transition(.move(edge: .top))
            SearchBarView(text: $searchValue)
                .transition(.move(edge: .top))
            
            Spacer()
            
            Footer(view: .search)
                .transition(.move(edge: .bottom))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static let navigationData = NavigationData()
    @State static var searchValue = "The Dark Knight"
    
    static var previews: some View {
        SearchView(searchValue: $searchValue)
            .environmentObject(navigationData)
        SearchView(searchValue: $searchValue)
            .environmentObject(navigationData)
            .preferredColorScheme(.dark)
    }
}

