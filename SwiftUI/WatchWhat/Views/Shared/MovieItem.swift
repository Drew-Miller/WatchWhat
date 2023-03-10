//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieItem: View {
    var movie: HomeQuery.Data.Home.Result.Movie
    let maxWidth: CGFloat
    let onTapGesture: (Int) -> Void
    
    var url: URL? {
        return URL(string: Configuration.imgUrlStr + movie.poster_path!)
    }
    
    var body: some View {
        VStack() {
            MoviePoster(imageUrl: movie.poster_path!, maxWidth: maxWidth)
            
            Text(movie.title)
                .font(.system(size: 15))
                .lineLimit(nil)
                .truncationMode(.tail)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 140)
            
            Spacer()
        }
        .onTapGesture {
            onTapGesture(movie.id)
        }
        .foregroundColor(Palette.text)
        .frame(height: 310)
    }
}
