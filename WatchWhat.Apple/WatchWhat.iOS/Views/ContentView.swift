//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authModel: AuthenticationViewModel
    @StateObject var appData = AppData()
    @State var searchValue = ""
    var movieId: Int? {
        return appData.movieId
    }
    
    var body: some View {
        ZStack {
            Background(topColor: .backgroundAccent, bottomColor: .background)
            
            // Views
            Group {
                switch appData.view {
                case .home:
                    HomeView()
                        .environmentObject(appData)
                case .search:
                    SearchView(searchValue: $searchValue)
                        .environmentObject(appData)
                case .movieDetails:
                    if let movieId = appData.movieId  {
                        MovieDetailView(id: movieId)
                            .environmentObject(appData)
                            .transition(.move(edge: .trailing))
                    } else {
                        Text("Returning...")
                            .onAppear {
                                appData.navigatePrevious()
                            }
                    }
                default:
                    Text("Returning...")
                        .onAppear {
                            appData.navigatePrevious()
                        }
                }
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $appData.presentingProfileScreen) {
            NavigationView {
                UserProfileView()
                    .environmentObject(authModel)
            }
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
