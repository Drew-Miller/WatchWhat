//
//  Search.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var viewModel = SearchViewModel()
    var selectedMovie: (Int) -> Void
        
    var body: some View {
        ZStack {
            // Movies
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.results.chunked(into: 2), id: \.self) { rowItems in
                        LazyHStack {
                            ForEach(rowItems, id: \.self) { movie in
                                MovieView(movie: movie) { movieId in
                                    selectedMovie(movieId)
                                }
                            }
                        }
                        
                    }
                }
                .searchPadding()
            }
            
            // Controls
            VStack {
                Header {
                    print("menu")
                }
                
                SearchBarView(text: $modelData.searchValue)
                
                Spacer()
            }
            
        }
        .task(id: modelData.searchValue) {
            let search = modelData.searchValue
            if !search.isEmpty {
                viewModel.loadData(query: search)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() { view in
            print("view changed")
        }
        .environmentObject(ModelData())
        
        SearchView() { view in
            print("view changed")
        }
        .environmentObject(ModelData())
        .preferredColorScheme(.dark)
    }
}

