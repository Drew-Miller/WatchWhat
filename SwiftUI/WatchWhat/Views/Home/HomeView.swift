//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeData = HomeData()
    let onMovieSelected: (Int) -> Void
        
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(homeData.results, id: \.self) { result in
                    MovieCategoryView(result: result, onTapGesture: onMovieSelected)
                }
            }
        }
        .onAppear {
            homeData.loadData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
