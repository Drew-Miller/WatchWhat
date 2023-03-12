//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieItem: View {
    var movie: Movie
    let maxWidth: CGFloat
    let onTapGesture: (Int) -> Void
    
    var url: URL? {
        return URL(string: Configuration.imgUrlStr + movie.poster_path!)
    }
    
    var body: some View {
        VStack() {
            MoviePoster(imageUrl: movie.poster_path, maxWidth: maxWidth)
            
            Text(movie.title)
                .padding(.top, 7)
                .font(.system(size: 12))
                .lineLimit(nil)
                .truncationMode(.tail)
                .frame(width: maxWidth - 10)
            
            Spacer()
        }
        .onTapGesture {
            onTapGesture(movie.id)
        }
        .foregroundColor(Palette.text)
        .frame(height: 320)
        .padding(.top, 20)
    }
}
