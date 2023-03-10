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
        HStack() {
            Button {
                modelData.movieId = nil
                onDismiss()
            } label: {
                Image(systemName: "chevron.left")
            }
            
            if let movie = movieData.movie {
                Text(movie.title)
                Text(movie.overview)
            }
        }
        .onAppear {
            movieData.loadData(id: self.id)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(id: 315162) {
            print("Dismissed")
        }
        .environmentObject(ModelData())
    }
}
