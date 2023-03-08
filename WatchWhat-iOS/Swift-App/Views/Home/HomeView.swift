//
//  GenreHome.swift
//  Swift-App
//
//  Created by Drew Miller on 11/8/22.
//

import SwiftUI

class HomeViewController: ObservableObject {
    @Published var genres = [Genre]()
    
    init() {
        self.loadGenres()
    }
    
    func loadGenres() {
        MovieService.shared.getGenres() { [weak self] result in
            guard let self = self
            else {
                return
            }
            
            switch result {
            case .success(let genreResponse):
                DispatchQueue.main.async {
                    self.genres = genreResponse.genres
                }
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
}

struct HomeView: View {
    @StateObject var controller = HomeViewController()
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                
                ScrollView {
                    ForEach (controller.genres, id: \.self) { genre in
                        VStack(alignment: .leading) {
                            GenreName(genre: genre)
                            MovieList(controller: MovieListController(genre.id))
                        }
                        .padding(.bottom, 36)
                    }
                }                
            }
        }
        .accentColor(Color("text"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ModelData())
    }
}

struct GenreName: View {
    var genre: Genre
    
    var body: some View {
        Text(genre.name.capitalized)
            .font(.system(size: 18, weight: .bold, design: .default))
            .foregroundColor(Color("text"))
            .tracking(0.7)
    }
}
