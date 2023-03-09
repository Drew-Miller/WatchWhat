//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeData = HomeData()

    var body: some View {
        ZStack {
            BackgroundView(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            HomeView(results: homeData.results)
                .onAppear {
                    homeData.loadData()
                }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
