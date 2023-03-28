//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
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
                CategoryRow(categoryName: category.title, items: category.movies)
            }
        }
        .task {
            await viewModel.loadData()
        }
    }
    
    var layout: some View {
        VStack {
            Header()
            
            Spacer()
            
            Footer(view: .home)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .preferredColorScheme(.dark)
    }
}
