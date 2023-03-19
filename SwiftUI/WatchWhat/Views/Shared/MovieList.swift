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
                LazyHStack(spacing: 12) {
                    ForEach(movies, id: \.self) { movie in
                        if let movie = movie {
                            listItem(movie: movie) { movieId in
                                onTapGesture(movieId)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func listItem(movie: Movie, onTapGesture: @escaping (Int) -> Void) -> some View {
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


struct MovieList_Previews: PreviewProvider {
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
