//
//  MovieDetail.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.openURL) private var openURL
    @EnvironmentObject var appData: AppData
    @StateObject var viewModel = MovieDetailViewModel()
    let id: Int
    var movie: MovieDetails {
        return viewModel.movie!
    }
    
    var body: some View {
        ZStack() {
            if viewModel.movie != nil {
                ScrollView {
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
                .font(.body)
                .foregroundColor(.text)
                .lineSpacing(8)
                .padding(.vertical, 16)
            
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
            .padding(.vertical, 8)
            
            HStack {
                Text("More Like This")
            }
            .font(.headline)
            .foregroundColor(.text)
            .padding(.vertical, 16)
            
            if let similar = viewModel.similar {
                MovieListView(movies: similar) { movieId in
                    appData.movieSelected(movieId)
                }
            }
        }
        .padding(.horizontal, 8)
    }
    
    var layout: some View {
        VStack {
            HStack {
                Button {
                    appData.navigatePrevious()
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
    static let appData = AppData()
    
    static var previews: some View {
        MovieDetailView(id: 315162)
            .environmentObject(appData)
        MovieDetailView(id: 315162)
            .environmentObject(appData)
            .preferredColorScheme(.dark)
    }
}
