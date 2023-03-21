//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appData: AppData
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                content
                    .headerPadding()
                    .footerPadding()
            }
            
            layout
        }
    }
    
    var content: some View {
        // Movies
        LazyVStack(alignment: .leading, spacing: 24) {
            ForEach(viewModel.categories, id: \.self) { category in
                Text(category.title)
                    .font(.title)
                    .foregroundColor(.text)
                
                MovieListView(movies: category.movies) { movieId in
                    appData.movieSelected(movieId)
                }
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
    
    var layout: some View {
        VStack {
            Header()
                .environmentObject(appData)
            
            Spacer()
            
            Footer(view: .home)
                .environmentObject(appData)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        HomeView()
            .environmentObject(appData)
        HomeView()
            .environmentObject(appData)
            .preferredColorScheme(.dark)
    }
}
