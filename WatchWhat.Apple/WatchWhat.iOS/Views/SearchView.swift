//
//  Search.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/10/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var searchData = SearchData()
    var selectedMovie: (Int) -> Void
        
    var body: some View {
        ZStack {
            // Movies
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(searchData.results.chunked(into: 2), id: \.self) { rowItems in
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
                
                SearchBar(text: $modelData.searchValue)
                
                Spacer()
            }
            
        }
        .task(id: modelData.searchValue) {
            let search = modelData.searchValue
            if !search.isEmpty {
                searchData.loadData(query: search)
            }
        }
    }
}

struct SearchVhew_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            SearchView() { view in
                print("view changed")
            }
        }
        .environmentObject(ModelData())
        .preferredColorScheme(.dark)
    }
}


extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeHolder: String {
        if !text.isEmpty {
            return ""
        } else {
            return "What're you searching for?"
        }
    }

    var body: some View {
        VStack {
            TextField(placeHolder, text: $text)
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                .background(Color.background2)
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}
