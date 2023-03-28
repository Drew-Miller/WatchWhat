//
//  Search.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var appData: AppData
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
                            appData.movieSelected(movieId)
                        }
                    }
                }
            }
        }
        .task(id: searchValue) {
            if !searchValue.isEmpty {
                await viewModel.loadData(query: searchValue)
            }
        }
    }
    
    var layout: some View {
        VStack {
            Header()
                .transition(.move(edge: .top))
                .environmentObject(appData)
            SearchBarView(text: $searchValue)
                .transition(.move(edge: .top))
            
            Spacer()
            
            Footer(view: .search)
                .transition(.move(edge: .bottom))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static let appData = AppData()
    @State static var searchValue = "The Dark Knight"
    
    static var previews: some View {
        SearchView(searchValue: $searchValue)
            .environmentObject(appData)
        SearchView(searchValue: $searchValue)
            .environmentObject(appData)
            .preferredColorScheme(.dark)
    }
}

