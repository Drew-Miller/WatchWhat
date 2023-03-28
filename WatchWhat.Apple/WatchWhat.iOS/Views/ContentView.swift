//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @StateObject var app = AppState.shared
        
    var body: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
            // Views
            Group {
                switch app.view {
                case .home:
                    HomeView()
                case .search:
                    SearchView(searchValue: $app.searchValue)
                case .movieDetails:
                    if let movieId = app.movieId  {
                        MovieDetailView(id: movieId)
                            .transition(.move(edge: .trailing))
                    } else {
                        Text("Returning...")
                            .onAppear {
                                app.navigatePrevious()
                            }
                    }
                default:
                    Text("Returning...")
                        .onAppear {
                            app.navigatePrevious()
                        }
                }
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $app.presentingLoginScreen) {
            UserProfileView()
                .environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
    }
}
