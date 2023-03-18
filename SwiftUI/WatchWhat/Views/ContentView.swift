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
    @State var movieId: Int?
    
    var body: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
            Group {
                switch navigation.view {
                case .home:
                    HomeView() { movieId in
                        withAnimation(.easeInOut(duration: 0.1)) {
                            onMovieSelected(movieId: movieId)
                        }
                    }
                case .search:
                    SearchView() { movieId in
                        withAnimation(.easeInOut(duration: 0.1)) {
                            onMovieSelected(movieId: movieId)
                        }
                    }
                case .movieDetails:
                    if let movieId = self.modelData.movieId  {
                        MovieDetailView(id: movieId) { movieId in
                            modelData.selectMovieId(movieId)
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
            
            
            VStack {                
                Spacer()
                
                if navigation.hasFooter {
                    Footer(view: navigation.view) { view in
                        setView(view)
                    }
                    .transition(.move(edge: .bottom))
                }
            }
        }
        .preferredColorScheme(.dark)
    }
    
    func onMovieSelected(movieId: Int) {
        modelData.selectMovieId(movieId)
        setView(.movieDetails)
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
