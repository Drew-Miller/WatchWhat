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
                                MovieItem(movie: movie, maxWidth: Configuration.movieItemWidth) { movieId in
                                    modelData.movieId = movieId
                                    changeView(.movieDetails)
                                }
                            }
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 55, leading: 0, bottom: 0, trailing: 0))
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
                SearchView_Header(search: $modelData.searchValue) {
                    print("menu")
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
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

struct SearchView_Header: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var search: String

    let onMenu: () -> Void

    var body: some View {
        HStack {
            SearchBar(text: $search)

            Spacer()
            
            UserIcon(initials: "D", color: Palette.primary, size: 28) {
                print("User Tapped")
            }
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
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

    var body: some View {
        TextField("Enter Text", text: $text)
            .padding()
    }
}
