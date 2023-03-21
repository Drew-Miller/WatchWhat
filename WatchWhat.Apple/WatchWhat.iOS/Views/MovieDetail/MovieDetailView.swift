//
//  MovieDetail.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.openURL) private var openURL
    @EnvironmentObject var navigationData: NavigationData
    @StateObject var viewModel = MovieDetailViewModel()
    let id: Int
    var movie: MovieDetails {
        return viewModel.movie!
    }
    
    var body: some View {
        ZStack() {
            if viewModel.movie != nil {
                ScrollView {
                    content
                }
                    .edgesIgnoringSafeArea(.all)
            }
            
            layout
        }
        .task(id: id) {
            viewModel.loadData(id: self.id, region: "US")
        }
        .task(id: viewModel.webUrl) {
            if !(viewModel.webUrl ?? "").isEmpty {
                openURL(URL(string: viewModel.webUrl!)!)
            }
        }
    }
    
    var content: some View {
        // Content View
        VStack(alignment: .leading) {
            MoviePosterView(imageUrl: movie.poster_path)
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
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 16.0) {
                    Text("\(movie.runtime / 60) HR \(movie.runtime % 60) MIN")
                    Text("\(movie.mpaa_rating)")
                    Text("\(getReleaseYear(date: movie.release_date))")
                    Text("\(String(format: "%0.1f", movie.vote_average))")
                }
                    .font(.caption)
                    .foregroundColor(.text)
                
                Text("\(movie.title)")
                    .font(.title)
                    .foregroundColor(.text)
            }
            
            if let streams = viewModel.stream {
                ForEach(streams, id: \.self.provider_id) { stream in
                    ProviderLogo(imageUrl: stream.logo_path, maxWidth: 48)
                        .onTapGesture {
                            viewModel.openWebUrl(id: movie.id, providerName: stream.provider_name)
                        }
                    
                }
            }
            
            Text(movie.overview)
                .font(.subheadline)
                .foregroundColor(.text)
                .lineSpacing(8)
                .padding(.top, 12)
            
            Button {
                if let trailers = viewModel.trailers {
                    openURL(URL(string: "https://youtube.com/embed/\(trailers[0].key)")!)
                }
            } label: {
                Image(systemName: "list.and.film")
                Text("TRAILER")
                    .monospaced()
            }
                .font(.headline)
                .foregroundColor(.text)
                .padding(.vertical, 12)

            HStack {
                Text("More Like This")
            }
                .font(.headline)
                .foregroundColor(.text)
                .padding(.vertical, 12)
            
            if let similar = viewModel.similar {
                MovieListView(movies: similar) { movieId in
                    navigationData.movieSelected(movieId)
                }
            }
        }
    }
    
    var layout: some View {
        VStack {
            HStack {
                Button {
                    navigationData.navigatePrevious()
                } label: {
                    Image(systemName: "chevron.left")
                        .icon()
                }
                
                Spacer()
            }
            
            Spacer()
        }
            .header()
            .transition(.move(edge: .top))
    }
    
    func getReleaseYear(date: String) -> String {
        return String(date.split(separator: "-")[0])
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static let navigationData = NavigationData()
    
    static var previews: some View {
        MovieDetailView(id: 315162)
            .environmentObject(navigationData)
        MovieDetailView(id: 315162)
            .environmentObject(navigationData)
            .preferredColorScheme(.dark)
    }
}
