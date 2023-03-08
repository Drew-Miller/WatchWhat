//
//  MovieDetail.swift
//  Swift-App
//
//  Created by Drew Miller on 11/8/22.
//

import SwiftUI

class MovieViewController: ObservableObject {
    @Published var cast = [Cast]()
    @Published var recommendations = [Recommendation]()
    @Published var videos = [Video]()
    
    init(_ movieId: Int) {
        self.loadCast(movieId)
        self.loadRecommendations(movieId)
        self.loadVideos(movieId)
    }
    
    func loadCast(_ movieId: Int) {
        MovieService.shared.getCredits(movieId: movieId) { [weak self] result in
            guard let self = self
            else {
                return
            }
            
            switch result {
            case .success(let creditsResponse):
                DispatchQueue.main.async {
                    self.cast = creditsResponse.cast
                }
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
    
    func loadRecommendations(_ movieId: Int) {
        MovieService.shared.getRecommendations(movieId: movieId) { [weak self] result in
            guard let self = self
            else {
                return
            }
            
            switch result {
            case .success(let recommendationsResponse):
                DispatchQueue.main.async {
                    self.recommendations = recommendationsResponse.results
                }
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
    
    func loadVideos(_ movieId: Int) {
        MovieService.shared.getVideos(movieId: movieId) { [weak self] result in
            guard let self = self
            else {
                return
            }
            
            switch result {
            case .success(let videosResponse):
                DispatchQueue.main.async {
                    self.videos = videosResponse.results
                }
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
}

struct MovieView: View {
    var movie: Movie
    @StateObject var controller: MovieViewController
    
    var body: some View {
        ZStack {
            Background(false)
            
            ScrollView {
                HeaderImage(url: movie.posterUrl!)
                
                GradientFade()
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 32) {
                        Votes(movie: movie)
                        Text(movie.year)
                    }
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    
                    
                    HStack(spacing: 24) {
                        PlayButton()
                        
                        Spacer()
                        
                        AppIcon("plus")
                        AppIcon("arrow.down.to.line")
                    }
                    .foregroundColor(Color("text"))
                    
                    SummaryText(movie: movie)
                    
                    Extras()
                }
                .padding([.leading, .trailing], 20)
                .padding([.top], -48)
            }
            .foregroundColor(Color("subtext"))
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        let movieResponse: MovieResponse = load("drama")
        let movie = movieResponse.results[0]
        MovieView(movie: movie, controller: MovieViewController(movie.id))
    }
}

struct HeaderImage: View {
    var url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "video")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(4/3, contentMode: .fit)
                .frame(width: 180, height: 645)
                .foregroundColor(Color("primary"))

        }
    }
}


struct GradientFade: View {
    var body: some View {
        LinearGradient(colors: [Color("backgroundStart"), Color.black.opacity(0)], startPoint: .bottom, endPoint: .top)
            .frame(height: 140)
            .padding(.top, -140)
    }
}

struct Votes: View {
    var movie: Movie

    var body: some View {
        HStack {
            Text(String(movie.voteAverage))
                .foregroundColor(Color("primary"))
            
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 10)
                .foregroundColor(Color("primary"))
        }
    }
}

struct SummaryText: View {
    var movie: Movie
    
    var body: some View {
        Text(movie.overview)
            .font(.system(size: 18, weight: .regular, design: .default))
            .foregroundColor(Color("subtext"))
    }
}

struct PlayButton: View {
    var body: some View {
        Image(systemName: "play.fill")
            .resizable()
            .scaledToFit()
            .frame(height: 22)
            .padding(.all, 22)
            .overlay(Circle().stroke(lineWidth: 2))
    }
}


struct Extras: View {
    var body: some View {
        VStack {
            Text("Extras")
                .foregroundColor(Color("text"))
                .font(.system(size: 20, weight: .medium, design: .rounded))
            
            HStack {
                
            }
        }
    }
}
