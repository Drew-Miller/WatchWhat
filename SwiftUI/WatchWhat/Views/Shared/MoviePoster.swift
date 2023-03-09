//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MoviePosterView: View {
    var movie: HomeQuery.Data.Home.Result.Movie
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: Configuration.imgUrlStr + movie.poster_path!)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "popcorn.fill")
                    .resizable()
                    .frame(width: 50, height: 70)
                    .foregroundColor(Palette.text)
            }
            .scaledToFit()
            .frame(width: 160, height: 240)
            .padding(.bottom, 7)
            
            Text(movie.title)
                .font(.system(size: 15))
                .foregroundColor(Palette.text)
                .lineLimit(nil)
                .truncationMode(.tail)
                .fixedSize(horizontal: false, vertical: true)
                .frame(width: 140)
            
            Spacer()
        }
        .frame(height: 310)
    }
}
