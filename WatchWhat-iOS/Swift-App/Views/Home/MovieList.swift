//
//  MovieListView.swift
//  Swift-App
//
//  Created by Drew Miller on 11/19/22.
//

import SwiftUI

class MovieListController: ObservableObject {
    @Published var movies = [Movie]()
    
    init(_ genreId: Int) {
        self.loadMovies(genreId)
    }
    
    func loadMovies(_ genreId: Int) {
        MovieService.shared.getMoviesByGenre(genreId: genreId) { [weak self] result in
            guard let self = self
            else {
                return
            }
            
            switch result {
            case .success(let movieResponse):
                DispatchQueue.main.async {
                    self.movies = movieResponse.results
                }
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
}

struct MovieList: View {
    @StateObject var controller: MovieListController
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(controller.movies, id: \.self) { movie in
                    NavigationLink(destination: MovieView(movie: movie, controller: MovieViewController(movie.id))) {
                        ListImage(url: movie.posterUrl!)
                    }
                    .navigationTitle("")
                }
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList(controller: MovieListController(1))
    }
}

struct ListImage: View {
    var url : URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 220, height: 320)
                .clipped()
        } placeholder: {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(4/3, contentMode: .fit)
                .frame(width: 220, height: 320)
                .background(Color.gray)
        }
    }
}
