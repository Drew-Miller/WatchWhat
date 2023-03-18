//
//  CategoryView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieList: View {
    var movies: [Movie]
    let onTapGesture: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading) {            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(movies, id: \.self) { movie in
                        if let movie = movie {
                            MovieItem(movie: movie, maxWidth: Configuration.moviePosterWidth) { v in
                                onTapGesture(v)
                            }
                            
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .foregroundColor(Palette.text)
        .padding(.vertical)
    }
}
