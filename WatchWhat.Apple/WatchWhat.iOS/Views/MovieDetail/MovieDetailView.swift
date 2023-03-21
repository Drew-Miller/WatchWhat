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
    @StateObject var viewModel = MovieDetailViewModel()
    let id: Int
    let onMovieSelected: (Int) -> Void
    
    var body: some View {
        ZStack() {
            // Link navigation
            if !(viewModel.webUrl ?? "").isEmpty {
                Text("Navgating...")
                    .onAppear {
                        openURL(URL(string: viewModel.webUrl!)!)
                    }
            }
            
            // Content View
            ScrollView {
                if let movie = viewModel.movie {
                    MovieDetail_Poster(posterPath: movie.poster_path!)
                    
                    VStack(alignment: .leading, spacing: 28) {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 16.0) {
                                Text("\(movie.runtime / 60) HR \(movie.runtime % 60) MIN")
                                Text("\(movie.mpaa_rating)")
                                Text("\(getReleaseYear(date: movie.release_date))")
                                Text("\(String(format: "%0.1f", movie.vote_average))")
                            }
                            .font(.xs)
                            .foregroundColor(.textBody)
                            
                            Text("\(movie.title)")
                                .font(.header)
                                .foregroundColor(.text)
                        }
                        
                        if let watchProviders = viewModel.watchProviders {
                            MovieDetail_WatchProviders(watchProviders: watchProviders) { providerName in
                                viewModel.openWebUrl(id: modelData.movieId!, providerName: providerName)
                            }
                        }
                        
                        Text(movie.overview)
                            .paragraph()
                            .foregroundColor(.textBody)
                        
                        HStack(spacing: 12.0) {
                            Button {
                                if let trailers = viewModel.trailers {
                                    openURL(URL(string: "https://youtube.com/embed/\(trailers[0].key)")!)
                                }
                            } label: {
                                Image(systemName: "list.and.film")
                                Text("TRAILER").monospaced()
                            }
                            .font(.section)
                            .foregroundColor(.textBody)
                        }
                        .sectionPadding()
    
                        HStack {
                            Text("More Like This")
                        }
                        .font(.section)
                        .sectionPadding()
                        
                        if let similar = viewModel.similar {
                            MovieListView(movies: similar) { movieId in
                                self.onMovieSelected(movieId)
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 10)
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
        .task(id: self.id) {
            viewModel.loadData(id: self.id, region: modelData.providerRegion)
        }
    }
    
    func getReleaseYear(date: String) -> String {
        return String(date.split(separator: "-")[0])
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
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
                Image(systemName: "chevron.left").headerIcon()
            }
            
            Spacer()
        }
        .header()
    }
}

struct MovieDetail_Poster: View {
    let posterPath: String
    
    var body: some View {
        MoviePosterView(imageUrl: posterPath)
            .mask(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: .background, location: 0.75),
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
    var onTapGesture: (String) -> Void
    
    var body: some View {
        HStack {
            if let flatrate = watchProviders.flatrate {
                ForEach(flatrate.prefix(4), id: \.self.provider_id) { flatrate in
                    ProviderLogo(imageUrl: flatrate.logo_path, maxWidth: 48)
                        .onTapGesture {
                            onTapGesture(flatrate.provider_name)
                        }
                    
                }
            }
        }
    }
}
