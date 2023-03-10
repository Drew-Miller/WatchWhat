//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var view: AppView = .home
    @State var previousView: AppView = .home
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            switch view {
            
            case .home:
                HomeView() { view in
                    withAnimation {
                        self.setView(view)
                    }
                }
                
            case .movieDetails:
                if let movieId = modelData.movieId {
                    MovieDetailView(id: movieId) {
                        withAnimation {
                            self.navigatePrevious()
                        }
                    }
                    .transition(.move(edge: .trailing))
                } else {
                    Text("Returning...")
                    .onAppear {
                        withAnimation {
                            self.navigatePrevious()
                        }
                    }
                }
                
            case .video:
                Text("Video view")
            }
        }
        .foregroundColor(Palette.text)
        .preferredColorScheme(.dark)
    }
    
    func setView(_ view: AppView) {
        self.previousView = self.view
        self.view = view
    }
    
    func navigatePrevious() {
        self.view = self.previousView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
