//
//  MovieDetail.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var movieData = MovieData()
    
    let id: Int
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack() {
            // Content View
            ScrollView {
                LazyVStack(spacing: 16) {
                    if let movie = movieData.movie {
                        MovieDetailsPoster(posterPath: movie.poster_path!)
                        
                        Text(movie.title)
                        Text(movie.overview)
                        
                        Spacer()
                    }
                }
            }
            .edgesIgnoringSafeArea([.top, .bottom])
            
            // Header controls
            MovieDetailControls {
                onDismiss()
            }
            .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
        }
        .foregroundColor(Palette.text)
        .onAppear {
            movieData.loadData(id: self.id)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            MovieDetailView(id: 315162) {
                print("Dismissed")
            }
            .environmentObject(ModelData())
        }
        .preferredColorScheme(.dark)
    }
}

struct MovieDetailControls: View {
    @EnvironmentObject var modelData: ModelData
    
    let onDismiss: () -> Void

    var body: some View {
        VStack {
            HStack {
                Button {
                    modelData.movieId = nil
                    onDismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 25, weight: .light, design: .default))
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
}

struct MovieDetailsPoster: View {
    let posterPath: String
    
    var body: some View {
        MoviePoster(imageUrl: posterPath, maxWidth: .infinity)
            .mask(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Palette.background, location: 0.75),
                        .init(color: Color.clear, location: 1)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}
