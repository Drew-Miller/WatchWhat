//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var navigationData: NavigationData
    @StateObject var viewModel = HomeViewModel()
        
    var body: some View {
        ZStack {
            ScrollView {
                content
                    .homePadding()
            }
            
            layout
        }
    }
    
    var content: some View {
        // Movies
        LazyVStack(alignment: .leading, spacing: 24) {
            ForEach(viewModel.categories, id: \.self) { category in
                Text(category.title)
                    .font(.header)
                    .foregroundColor(.text)
                
                MovieListView(movies: category.movies) { movieId in
                    navigationData.movieSelected(movieId)
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
            
            Spacer()
            
            Footer(view: .home)
                .environmentObject(navigationData)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let navigationData = NavigationData()
    static var previews: some View {
        HomeView()
            .environmentObject(navigationData)
        HomeView()
            .environmentObject(navigationData)
            .preferredColorScheme(.dark)
    }
}
