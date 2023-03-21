//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationData = NavigationData()
    @State var searchValue = ""
    var movieId: Int? {
        return navigationData.movieId
    }
    
    var body: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
            // Views
            Group {
                switch navigationData.view {
                case .home:
                    HomeView()
                        .environmentObject(navigationData)
                case .search:
                    SearchView(searchValue: $searchValue)
                        .environmentObject(navigationData)
                case .movieDetails:
                    if let movieId = navigationData.movieId  {
                        MovieDetailView(id: movieId)
                            .environmentObject(navigationData)
                            .transition(.move(edge: .trailing))
                    } else {
                        Text("Returning...")
                            .onAppear {
                                navigationData.navigatePrevious()
                            }
                    }
                default:
                    Text("Returning...")
                        .onAppear {
                            navigationData.navigatePrevious()
                        }
                }
            }
        }
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
