//
//  HomeView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/9/23.
//

import SwiftUI

struct HomeView: View {
    var results: [HomeQuery.Data.Home.Result]
        
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(results, id: \.self) { result in
                    MovieCategoryView(result: result)
                }
            }
        }
    }
}
