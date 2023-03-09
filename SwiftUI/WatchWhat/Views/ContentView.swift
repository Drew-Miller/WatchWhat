//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeData = HomeData()

    var body: some View {
        ZStack {
            BackgroundView(topColor: Palette.background, bottomColor: Palette.background)
            
            MovieAppView(results: homeData.results)
                .onAppear {
                    homeData.loadData()
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
    var results: [HomeQuery.Data.Home.Result]
        
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(results, id: \.self) { result in
                    CategoryView(result: result)
                }
            }
        }
    }
}

struct CategoryView: View {
    var result: HomeQuery.Data.Home.Result
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(result.title)
                .foregroundColor(Palette.text)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(result.movies, id: \.self) { movie in
                        if let movie = movie {
                            MoviePosterView(movie: movie)
                            
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
    var movie: HomeQuery.Data.Home.Result.Movie
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: Configuration.imgUrlStr + movie.poster_path!)) { image in
                image.resizable()
            } placeholder: {
                Image("placeholder_image").resizable()
            }
            .scaledToFit()
            .cornerRadius(8)
            .frame(width: 160, height: 240)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            
            Text(movie.title)
                .font(.custom("Rajdhani-Regular", size: 14))
                .foregroundColor(Palette.text)
        }
    }
}
