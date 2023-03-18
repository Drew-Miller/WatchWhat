//
//  MovieDetail.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.openURL) private var openURL
    @EnvironmentObject var modelData: ModelData
    @StateObject var movieData = MovieData()
    let id: Int
    let onMovieSelected: (Int) -> Void
    
    var body: some View {
        ZStack() {
            // Link navigation
            if !(movieData.webUrl ?? "").isEmpty {
                Text("Navgating...")
                    .onAppear {
                        openURL(URL(string: movieData.webUrl!)!)
                    }
            }
            
            // Content View
            ScrollView {
                if let movie = movieData.movie {
                    MovieDetail_Poster(posterPath: movie.poster_path!)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            let padRight = 16.0
                            
                            Text("\(movie.runtime / 60) HR \(movie.runtime % 60) MIN")
                                .padding(.trailing, padRight)
                            Text("\(movie.mpaa_rating)")
                                .padding(.trailing, padRight)
                            Text("\(getReleaseYear(date: movie.release_date))")
                                .padding(.trailing, padRight)
                            
                            Text("\(String(format: "%g", movie.vote_average))")
                                .padding(.trailing, padRight)
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Palette.textBody)
                        
                        if let watchProviders = movieData.watchProviders {
                            MovieDetail_WatchProviders(watchProviders: watchProviders) { providerName in
                                movieData.openWebUrl(id: modelData.movieId!, providerName: providerName)
                            }
                        }
                        
                        Text("\(movie.title)")
                            .font(.title2)
                            .foregroundColor(Palette.text)
                        
                        Text(movie.overview)
                            .foregroundColor(Palette.textBody)
                            .font(.system(size: 14))
                        
                        HStack {
                            Image(systemName: "list.and.film")
                                .padding(.trailing, 12)
                            Text("TRAILERS")
                                .monospaced()
                        }
                        .font(.system(size: 14))
                        .padding([.top, .bottom], 20)
                        
    
                        HStack {
                            Text("More Like This")
                                .font(.system(size: 14, weight: .bold))
                        }
                        .padding([.top, .bottom], 20)
                        
                        if let recommendations = movieData.recommendations {
                            MovieList(movies: recommendations) { movieId in
                                self.onMovieSelected(movieId)
                            }
                        }
                        
                        
                        Spacer()
                    }
                    .padding(EdgeInsets(top: -20, leading: 10, bottom: 0, trailing: 10))
                }
            }
            .edgesIgnoringSafeArea(.all)
            
            // Header controls
            VStack {
                MovieDetail_Header() {
                    modelData.removeMovieId()
                }
                
                Spacer()
            }
            
        }
        .foregroundColor(Palette.text)
        .task(id: self.id) {
            movieData.loadData(id: self.id, region: modelData.providerRegion)
        }
    }
    
    func getReleaseYear(date: String) -> String {
        return String(date.split(separator: "-")[0])
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            MovieDetailView(id: 315162) { movieId in
                print("movie selected")
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


struct MovieDetail_WatchProviders: View {
    let watchProviders: WatchProviders
    let maxCount = 4
    var onTapGesture: (String) -> Void
    
    var body: some View {
        HStack {
            if let flatrate = watchProviders.flatrate {
                ForEach(flatrate.prefix(maxCount), id: \.self.provider_id) { flatrate in
                    ProviderLogo(imageUrl: flatrate.logo_path, maxWidth: Configuration.providerLogoWidth)
                        .onTapGesture {
                            onTapGesture(flatrate.provider_name)
                        }
                    
                }
            }
        }
    }
}
