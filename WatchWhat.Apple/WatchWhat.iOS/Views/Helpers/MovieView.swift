//
//  MovieView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/19/23.
//

import SwiftUI

struct MovieView: View {
    let movie: Movie
    var onTapGesture: (Int) -> Void
    
    var body: some View {
        VStack() {
            MoviePosterView(imageUrl: movie.poster_path)
            
            Text(movie.title)
                .font(.xs)
                .foregroundColor(.text)
                .padding(.top, 6)
                .lineLimit(nil)
                .truncationMode(.tail)
            
            Spacer()
        }
        .onTapGesture {
            onTapGesture(movie.id)
        }
        .frame(width: 192)
    }
}
