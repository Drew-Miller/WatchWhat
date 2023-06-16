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
                case .details:
                    if let selectedId = app.selectedId  {
                        switch selectedId.media {
                        case .movie:
                            MovieDetailView(id: selectedId.id)
                                .transition(.move(edge: .trailing))
                        case .tv:
                            // Change this to TV
                            MovieDetailView(id: selectedId.id)
                                .transition(.move(edge: .trailing))
                        default:
                            returning
                        }
                        
                    } else {
                        returning
                    }
                default:
                    returning
                }
            }
        }
        .sheet(isPresented: $app.presentingLoginScreen) {
            UserProfileView()
                .environmentObject(viewModel)
        }
    }
    
    var returning: some View {
        Text("Returning...")
            .onAppear {
                app.navigatePrevious()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
        ContentView()
            .environmentObject(AuthenticationViewModel())
            .preferredColorScheme(.dark)
    }
}
