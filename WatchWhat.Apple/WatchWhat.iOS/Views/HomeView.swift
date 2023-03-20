//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeData = HomeData()
    var selectedMovie: (Int) -> Void
        
    var body: some View {
        ZStack {
            // Movies
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(homeData.results, id: \.self) { result in
                        HStack {
                            Text(result.title)
                                .font(.header)
                                .foregroundColor(.text)
                            
                            Spacer()
                        }
                        
                        MovieListView(movies: result.movies) { movieId in
                            selectedMovie(movieId)
                        }
                    }
                }
                .homePadding()
            }
            
            // Controls
            VStack {
                Header {
                    print("menu")
                }
                
                Spacer()
            }
            
        }
        .onAppear {
            homeData.loadData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
            HomeView() { view in
                print("view changed")
            }
        }
        .preferredColorScheme(.dark)
        .environmentObject(ModelData())
    }
}
