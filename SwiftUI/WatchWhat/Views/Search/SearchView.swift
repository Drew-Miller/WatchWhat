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
    var changeView: (AppView) -> Void
        
    var body: some View {
        ZStack {
            // Movies
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(searchData.results.chunked(into: 2), id: \.self) { rowItems in
                        LazyHStack {
                            ForEach(rowItems, id: \.self) { movie in
                                MovieItem(movie: movie, maxWidth: Configuration.moviePosterWidth) { movieId in
                                    modelData.movieId = movieId
                                    changeView(.movieDetails)
                                }
                            }
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 110, leading: 0, bottom: 0, trailing: 0))
            }
            .onAppear {
                search()
            }
            .onChange(of: modelData.searchValue) { _ in
                search()
            }
            .padding(.bottom, 50)
            
            // Controls
            VStack {
                Header {
                    print("menu")
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                SearchBar(text: $modelData.searchValue)
                
                Spacer()
                
                Footer(view: .search) { view in
                    changeView(view)
                }
            }
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .foregroundColor(Palette.text)
    }
    
    func search() {
        let search = modelData.searchValue
        if !search.isEmpty {
            searchData.loadData(query: search)
        }
    }
}

struct SearchVhew_Previews: PreviewProvider {
    static var previews: some View {
        SearchView() { view in
            print("view changed")
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
                .background(Palette.footer)
                .foregroundColor(.gray)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}
