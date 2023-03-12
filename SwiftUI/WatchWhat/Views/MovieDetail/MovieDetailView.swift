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
                if let movie = movieData.movie {
                    MovieDetail_Poster(posterPath: movie.poster_path!)
                    
                    if let watchProviders = movieData.watchProviders {
                        MovieDetail_WatchProviders(movie: movie, watchProviders: watchProviders)
                    }
                    
                    MovieDetail_Movie(movie: movie)
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            // Header controls
            VStack {
                MovieDetail_Header() {
                    modelData.movieId = nil
                    onDismiss()
                }
                
                Spacer()
            }
            
        }
        .foregroundColor(Palette.text)
        .onAppear {
            movieData.loadData(id: self.id, region: modelData.providerRegion)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            MovieDetailView(id: 315162) {
                print("dismissed")
            }
            .environmentObject(ModelData())
        }
        .preferredColorScheme(.dark)
    }
}

struct MovieDetail_Header: View {
    @EnvironmentObject var modelData: ModelData
    
    let onDismiss: () -> Void

    var body: some View {
        HStack {
            Button {
                onDismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 25, weight: .light, design: .default))
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 20))
    }
}

struct MovieDetail_WatchProviders: View {
    let movie: Movie
    let watchProviders: WatchProviders
    let maxCount = 4
    var body: some View {
        VStack {
            HStack {
                if let buy = watchProviders.buy {
                    ForEach(buy.prefix(maxCount), id: \.self.provider_id) { buy in
                        ProviderLogo(imageUrl: buy.logo_path, maxWidth: Configuration.providerLogoWidth)
                    }
                }
            }
            
            HStack {
                if let rent = watchProviders.rent {
                    ForEach(rent.prefix(maxCount), id: \.self.provider_id) { rent in
                        ProviderLogo(imageUrl: rent.logo_path, maxWidth: Configuration.providerLogoWidth)
                    }
                }
            }
            
            HStack {
                if let flatrate = watchProviders.flatrate {
                    ForEach(flatrate.prefix(maxCount), id: \.self.provider_id) { flatrate in
                        ProviderLogo(imageUrl: flatrate.logo_path, maxWidth: Configuration.providerLogoWidth)
                        
                    }
                }
            }
        }
        
    }
}

struct MovieDetail_Movie: View {
    let movie: MovieQuery.Data.Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("\(getReleaseYear(date: movie.release_date))")
                Text("\(movie.runtime) min")
            }
            .foregroundColor(Palette.accent)
            
            Text(movie.overview)
                .font(.body)
            
            Spacer()
        }
        .padding(EdgeInsets(top: -20, leading: 10, bottom: 0, trailing: 10))
    }
    
    
    func getReleaseYear(date: String) -> String {
        return String(date.split(separator: "-")[0])
    }
}

struct MovieDetail_Poster: View {
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
