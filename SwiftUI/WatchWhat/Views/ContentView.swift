//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

class MovieCategories: ObservableObject {
    @Published private(set) var category: String?
    @Published private(set) var movies: [WatchWhatSchema.PopularMoviesQuery.Data.PopularMovies.Result?]?
}

struct ContentView: View {
    @StateObject var popularMovies = PopularMovies()

    var body: some View {
        MovieAppView(movies: popularMovies.results)
            .onAppear {
                popularMovies.loadData()
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
    var movies: [WatchWhatSchema.PopularMoviesQuery.Data.PopularMovies.Result?]?
        
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 0) {                    
                    ForEach(categories, id: \.self) { category in
                        CategoryView(category: category, movies: movies)
                    }
                    
                    FooterView()
                }
            }
        }
    }
}

struct CategoryView: View {
    let category: String
    var movies: [WatchWhatSchema.PopularMoviesQuery.Data.PopularMovies.Result?]?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
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
    var movie: WatchWhatSchema.PopularMoviesQuery.Data.PopularMovies.Result

    var body: some View {
        Image("poster-placeholder")
            .resizable()
            .scaledToFit()
            .cornerRadius(8)
            .frame(width: 160, height: 240)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        Text(movie.title)
    }
}

struct FooterView: View {
    
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: Text("Favorites")) {
                Image(systemName: "heart.fill")
                    .font(.title)
            }
            Spacer()
            NavigationLink(destination: Text("Search")) {
                Image(systemName: "magnifyingglass")
                    .font(.title)
            }
            Spacer()
            NavigationLink(destination: Text("Settings")) {
                Image(systemName: "gearshape")
                    .font(.title)
            }
            Spacer()
            NavigationLink(destination: Text("Profile")) {
                Image(systemName: "person.crop.circle")
                    .font(.title)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

