//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var navigation = Navigation()
    
    var body: some View {
        ZStack {
            Background(topColor: Palette.backgroundAccent, bottomColor: Palette.background)
            
            switch navigation.view {
            
            case .home:
                HomeView() { view in
                    withAnimation(.easeInOut(duration: 0.15)) {
                        setView(view)
                    }
                }
                
            case .search:
                SearchView() { view in
                    withAnimation(.easeInOut(duration: 0.15)) {
                        setView(view)
                    }
                }
                
            case .movieDetails:
                if let movieId = modelData.movieId {
                    MovieDetailView(id: movieId) {
                        withAnimation {
                            navigatePrevious()
                        }
                    }
                    .transition(.move(edge: .trailing))
                } else {
                    Content_DefaultView() {
                        withAnimation {
                            navigatePrevious()
                        }
                    }
                }
                
            default:
                Content_DefaultView() {
                    withAnimation {
                        navigatePrevious()
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .foregroundColor(Palette.text)
        .preferredColorScheme(.dark)
    }
    
    func setView(_ view: AppView) {
        navigation.setView(view)
    }
    
    func navigatePrevious() {
        navigation.navigatePrevious()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

struct Content_DefaultView: View {
    var returning: () -> Void
    
    var body: some View {
        Text("Returning...")
        .onAppear {
            returning()
        }
    }
}
