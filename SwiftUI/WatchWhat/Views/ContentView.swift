//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            switch modelData.view {
                
            case .home:
                HomeView() { movieId in
                    modelData.movieId = movieId
                    withAnimation {
                        modelData.setView(.movieDetails)
                    }
                }
                //.transition(.move(edge: .leading))
                
            case .movieDetails:
                if let movieId = modelData.movieId {
                    MovieDetailView(id: movieId) {
                        withAnimation {
                            modelData.navigatePrevious()
                        }
                    }
                    .transition(.move(edge: .trailing))
                } else {
                    Text("Returning...")
                        .onAppear {
                            modelData.navigatePrevious()
                        }
                }
                
            case .video:
                Text("Video view")
            }
            
            
        }
        .foregroundColor(Palette.text)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
