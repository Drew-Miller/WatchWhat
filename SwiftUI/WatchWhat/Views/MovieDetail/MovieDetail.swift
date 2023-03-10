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
                        MoviePoster(imageUrl: movie.poster_path!, width: .infinity, height: 600)
                        
                        Text(movie.title)
                        Text(movie.overview)
                        
                        Spacer()
                    }
                }
            }
            .edgesIgnoringSafeArea([.top, .bottom])
            
            // Header controls
            MovieDetailControlView {
                onDismiss()
            }
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

struct MovieDetailControlView: View {
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
                }
                
                Spacer()
            }
            Spacer()
        }
    }
}
