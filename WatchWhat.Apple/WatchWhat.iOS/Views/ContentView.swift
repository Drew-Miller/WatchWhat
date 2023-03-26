//
//  ContentView.swift
//  WatchWhat
//
//  Created by Drew Miller on 3/7/23.
//

import SwiftUI

@MainActor
class ContentModel: ObservableObject {
    @Published var authenticated = ""
    
    func load(idToken: String) async {
        Apollo.client.fetch(query: WatchWhatSchema.AuthenticatedQuery()) { result in
            guard let data = try? result.get().data else { return }
            self.authenticated = data.authenticated
            print(self.authenticated)
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @StateObject var appData = AppData()
    @StateObject var contentModel = ContentModel()
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
                    .environmentObject(viewModel)
            }
        }
        .task(id: viewModel.idToken) {
            if let idToken = viewModel.idToken {
                Task {
                    await contentModel.load(idToken: idToken)
                }
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
