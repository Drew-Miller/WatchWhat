//
//  Search.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @Binding var searchValue: String
    
    var body: some View {
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
                        CategoryItem(item: movie)
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
            
            SearchBarView(text: $searchValue)
                .transition(.move(edge: .top))
            
            Spacer()
            
            Footer(view: .search)
                .transition(.move(edge: .bottom))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    @State static var searchValue = "The Dark Knight"
    
    static var previews: some View {
        SearchView(searchValue: $searchValue)
        SearchView(searchValue: $searchValue)
            .preferredColorScheme(.dark)
    }
}

