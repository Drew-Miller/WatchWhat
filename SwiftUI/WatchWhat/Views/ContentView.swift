//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var popularMovies = PopularMovies()

    var body: some View {
        ZStack {
            BackgroundView(topColor: Palette.background, bottomColor: Palette.background)
            
            MovieAppView(movies: popularMovies.results)
                .onAppear {
                    popularMovies.loadData()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MovieAppView: View {
    let categories = ["Popular"]
    var movies: [PopularMoviesResult?]?
        
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(categories, id: \.self) { category in
                    CategoryView(category: category, movies: movies)
                }
            }
        }
    }
}

struct CategoryView: View {
    let category: String
    var movies: [PopularMoviesResult?]?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .foregroundColor(Palette.text)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    if let movies = movies {
                        ForEach(movies, id: \.self) { movie in
                            if let movie = movie {
                                MoviePosterView(movie: movie)
                                
                            }
                        }
                    }
                    
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct MoviePosterView: View {
    var movie: PopularMoviesResult
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: Configuration.movieImageUrl + movie.poster_path!)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                    .frame(width: 160, height: 240)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            } placeholder: {
                Image("placeholder_image")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                    .frame(width: 160, height: 240)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            Text(movie.title)
                .foregroundColor(Palette.text)
        }
    }
}
