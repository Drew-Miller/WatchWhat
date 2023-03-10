//
//  CategoryView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieList: View {
    var result: MovieCategory
    let onTapGesture: (Int) -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text(result.title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(result.movies, id: \.self) { movie in
                        if let movie = movie {
                            MovieItem(movie: movie, maxWidth: Configuration.movieItemWidth) { v in
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
