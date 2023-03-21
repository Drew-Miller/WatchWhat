//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var selectedMovie: (Int) -> Void
        
    var body: some View {
        ZStack {
            // Movies
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(viewModel.categories, id: \.self) { category in
                        HStack {
                            Text(category.title)
                                .font(.header)
                                .foregroundColor(.text)
                            
                            Spacer()
                        }
                        
                        MovieListView(movies: category.movies) { movieId in
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
            viewModel.loadData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView() { view in
            print("view changed")
        }
        .environmentObject(ModelData())
        
        HomeView() { view in
            print("view changed")
        }
        .preferredColorScheme(.dark)
        .environmentObject(ModelData())
    }
}
