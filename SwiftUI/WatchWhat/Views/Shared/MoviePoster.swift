//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MoviePosterView: View {
    @EnvironmentObject var modelData: ModelData
    var movie: HomeQuery.Data.Home.Result.Movie
    let onTapGesture: (Int) -> Void
    
    var url: URL? {
        return URL(string: Configuration.imgUrlStr + movie.poster_path!)
    }
    
    var body: some View {
        VStack() {
            AsyncImage(url: self.url) { image in
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
        .onTapGesture {
            onTapGesture(movie.id)
        }
        .frame(height: 310)
    }
}
