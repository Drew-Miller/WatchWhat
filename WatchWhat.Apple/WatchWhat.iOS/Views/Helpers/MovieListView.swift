//
//  CategoryView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieListView: View {
    var movies: [Movie]
    let onTapGesture: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(movies, id: \.self) { movie in
                        MovieView(movie: movie) { movieId in
                            onTapGesture(movieId)
                        }
                    }
                }
            }
        }
    }
}
