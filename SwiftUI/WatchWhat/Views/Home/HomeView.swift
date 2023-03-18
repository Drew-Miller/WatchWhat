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
                LazyVStack(spacing: 0) {
                    ForEach(homeData.results, id: \.self) { result in
                        HStack {
                            Text(result.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .foregroundColor(Palette.text)
                            
                            Spacer()
                        }
                        
                        
                        MovieList(movies: result.movies) { movieId in
                            selectedMovie(movieId)
                        }
                    }
                }
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
            }
            .onAppear {
                homeData.loadData()
            }
            .padding(.bottom, 25)
            
            // Controls
            VStack {
                Header {
                    print("menu")
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                
                Spacer()
            }
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .foregroundColor(Palette.text)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Background(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            HomeView() { view in
                print("view changed")
            }
        }
        .preferredColorScheme(.dark)
        .environmentObject(ModelData())
    }
}
