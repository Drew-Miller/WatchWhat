//
//  MoviePoster.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieListItem: View {
    var movie: Movie
    let onTapGesture: (Int) -> Void
    
    var url: URL? {
        return URL(string: Configuration.imgUrlStr + movie.poster_path!)
    }
    
    var body: some View {
        VStack() {
            MoviePoster(imageUrl: movie.poster_path)
            
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

struct MovieListItem_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
            HomeView() { view in
                print("view changed")
            }
        }
        .preferredColorScheme(.dark)
        .environmentObject(ModelData())
    }
}
